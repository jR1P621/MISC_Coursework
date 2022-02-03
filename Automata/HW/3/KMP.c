#include <stddef.h>
#include <stdint.h>

void *computePrefixFunction(const char *needle, size_t m, int *pi) {
  pi[0] = 0;
  int k = 0;
  for (int q = 1; q < m; q++) {
    while (k > 0 && needle[k] != needle[q]) {
      k = pi[k - 1];
    }
    if (needle[k] == needle[q]) {
      k++;
    }
    pi[q] = k;
  }
}

static void matchStringsDoWorkKMP(char *res, const unsigned char *haystack,
                                  size_t n, const unsigned char *needle,
                                  size_t m) {
  /* TODO */
  int pi[m];
  computePrefixFunction(needle, m, pi);
  int q = 0;
  for (int i = 0; i < n; i++) {
    res[i] = 0;
    while (q > 0 && needle[q] != haystack[i]) {
      q = pi[q - 1];
    }
    if (needle[q] == haystack[i]) {
      q++;
    }
    if (q == m) {
      res[i - (m - 1)] = 1;
      q = pi[q - 1];
    }
  }
}

void matchStringsKMP(char *res, const char *haystack, const char *needle) {
  matchStringsDoWorkKMP(res, (const unsigned char *)haystack, length(haystack),
                        (const unsigned char *)needle, length(needle));
}
