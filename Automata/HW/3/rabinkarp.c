/*

    Copyright 2019-20 by

    University of Alaska Anchorage, College of Engineering.

    All rights reserved.

    Contributors:  Jon Rippe                 and
                   Christoph Lauter

*/

#include <stddef.h>
#include <stdint.h>

#define Q ((uint64_t)(18446744073709551359ull)) /* 2^64 - 257 is prime */
#define TWO64_MOD_Q ((uint64_t)(257))           /* 2^64 mod Q */
#define TWO9_MOD_Q ((uint64_t)(512))            /* 2^9 mod Q */

static inline uint64_t getBase() {
  unsigned char m;
  uint64_t base;

  m = (unsigned char)0;
  m--;
  base = (uint64_t)m;
  base++;
  return base;
}

static inline uint64_t addModulo(uint64_t a, uint64_t b) {
  __uint128_t t;
  uint64_t c, s;

  t = ((__uint128_t)a) + ((__uint128_t)b);
  s = (uint64_t)t;
  c = (uint64_t)(t >> 64);
  return (((s % Q) + (c * TWO64_MOD_Q)) % Q);
}

static inline uint64_t addModuloChar(uint64_t a, unsigned char b) {
  if (getBase() > TWO64_MOD_Q) {
    return addModulo(a, (uint64_t)b);
  }

  return (((a % Q) + ((uint64_t)b)) % Q);
}

static inline uint64_t subModulo(uint64_t a, uint64_t b) {
  return addModulo(a, Q - (b % Q));
}

static inline uint64_t mulModulo(uint64_t a, uint64_t b) {
  __uint128_t t, r;
  uint64_t h, l, s, c;

  t = ((__uint128_t)a) * ((__uint128_t)b);
  l = (uint64_t)t;
  h = (uint64_t)(t >> 64);
  r = (((__uint128_t)h) * ((__uint128_t)TWO64_MOD_Q)) + ((__uint128_t)l);
  s = (uint64_t)r;
  c = (uint64_t)(r >> 64);
  return (((s % Q) + (c * TWO64_MOD_Q)) % Q);
}

static inline uint64_t mulModuloBase(uint64_t a) {
  uint64_t base;
  __uint128_t r;
  uint64_t h, l, s, c;

  base = getBase();
  if (base != (1 << 8)) {
    return mulModulo(a, base);
  }

  l = a << 8;
  h = a >> 56;
  r = (((__uint128_t)h) * ((__uint128_t)TWO64_MOD_Q)) + ((__uint128_t)l);
  s = (uint64_t)r;
  c = (uint64_t)(r >> 64);
  return (((s % Q) + (c * TWO64_MOD_Q)) % Q);
}

static inline uint64_t mulModuloChar(uint64_t a, unsigned char b) {
  return mulModulo(a, ((uint64_t)b));
}

static void matchStringsDoWorkRK(char *res, const unsigned char *haystack,
                                 size_t n, const unsigned char *needle,
                                 size_t m) {
  /* TODO */
  uint64_t p = 0, t = 0;
  uint64_t h = 1;

  for (uint64_t i = 0; i < m - 1; i++) {
    h = mulModuloBase(h);
  }

  for (uint64_t i = 0; i < m; i++) {
    p = (addModuloChar(mulModuloBase(p), needle[i]));
    t = (addModuloChar(mulModuloBase(t), haystack[i]));
  }

  for (uint64_t s = 0; s < n - m + 1; s++) {
    res[s] = 0;
    if (p == t) {
      res[s] = 1;
      for (uint64_t i = 0; i < m && res[s] == 1; i++) {
        if (needle[i] != haystack[s + i]) {
          res[s] = 0;
        }
      }
    }
    if (s < n - m) {
      t = addModuloChar(
          mulModuloBase(subModulo(t, mulModuloChar(h, haystack[s]))),
          haystack[s + m]);
    }
  }
}

void matchStringsRK(char *res, const char *haystack, const char *needle) {
  matchStringsDoWorkRK(res, (const unsigned char *)haystack, length(haystack),
                       (const unsigned char *)needle, length(needle));
}
