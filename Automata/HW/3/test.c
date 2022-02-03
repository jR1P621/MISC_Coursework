/*

    Copyright 2019-20 by

    University of Alaska Anchorage, College of Engineering.

    All rights reserved.

    Contributors:  Christoph Lauter

    This code was crudely modified to run all three algorithms at the same time

*/

#include "test.h"

#include "KMP.c"
#include "naive.c"
#include "rabinkarp.c"
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/time.h>

// void matchStrings(char *, const char *, const char *);

int readFile(char **str, const char *filename) {
  FILE *fs;
  size_t allocated, i;
  char *buffer, *nbuffer;
  int r;
  char c;
  unsigned char cc;

  fs = fopen(filename, "r");
  if (fs == NULL) {
    perror(filename);
    return 0;
  }

  allocated = (size_t)1024;
  buffer = (char *)calloc(allocated, sizeof(char));
  if (buffer == NULL) {
    if (fclose(fs)) {
      perror(filename);
    }
    return 0;
  }

  i = (size_t)1;
  while (!feof(fs)) {
    r = fgetc(fs);
    if (r == EOF)
      break;
    cc = (unsigned char)r;
    c = *((char *)&cc);
    if (i > allocated) {
      allocated <<= 1;
      nbuffer = (char *)realloc(buffer, allocated);
      if (nbuffer == NULL) {
        if (fclose(fs)) {
          perror(filename);
        }
        free(buffer);
        return 0;
      }
      buffer = nbuffer;
    }
    buffer[i - (size_t)1] = c;
    i++;
  }
  if (fclose(fs)) {
    perror(filename);
  }
  nbuffer = (char *)realloc(buffer, i);
  if (buffer == NULL) {
    free(buffer);
    return 0;
  }
  buffer = nbuffer;
  buffer[i - 1] = '\0';
  *str = buffer;
  return 1;
}

uint64_t getTime() {
  struct timeval tv;

  gettimeofday(&tv, NULL);

  return (uint64_t)(
      (((__uint128_t)tv.tv_sec) * ((__uint128_t)1000) * ((__uint128_t)1000)) +
      ((__uint128_t)tv.tv_usec));
}

void testNaive(char *filename, size_t s, char *res, const char *haystack,
               const char *needle) {
  uint64_t before, after;

  before = getTime();
  matchStringsNaive(res, haystack, needle);
  after = getTime();

  printf("NAIVE TEST:\n");
  printf("The matches of \"%s\" in the text in file \"%s\" are at offsets:\n",
         needle, filename);
  for (size_t i = (size_t)0; i < s; i++) {
    if (res[i]) {
      printf("%zu\n", i);
    }
  }

  printf("Matching of \"%s\" in the text in file \"%s\" took %llu us\n", needle,
         filename,
         (unsigned long long)((after > before) ? (after - before)
                                               : ((uint64_t)0)));
}

void testRK(char *filename, size_t s, char *res, const char *haystack,
            const char *needle) {
  uint64_t before, after;

  before = getTime();
  matchStringsRK(res, haystack, needle);
  after = getTime();

  printf("Rabin-Karp TEST:\n");
  printf("The matches of \"%s\" in the text in file \"%s\" are at offsets:\n",
         needle, filename);
  for (size_t i = (size_t)0; i < s; i++) {
    if (res[i]) {
      printf("%zu\n", i);
    }
  }

  printf("Matching of \"%s\" in the text in file \"%s\" took %llu us\n", needle,
         filename,
         (unsigned long long)((after > before) ? (after - before)
                                               : ((uint64_t)0)));
}

void testKMP(char *filename, size_t s, char *res, const char *haystack,
             const char *needle) {
  uint64_t before, after;

  before = getTime();
  matchStringsKMP(res, haystack, needle);
  after = getTime();

  printf("Knuth-Morris-Pratt TEST:\n");
  printf("The matches of \"%s\" in the text in file \"%s\" are at offsets:\n",
         needle, filename);
  for (size_t i = (size_t)0; i < s; i++) {
    if (res[i]) {
      printf("%zu\n", i);
    }
  }

  printf("Matching of \"%s\" in the text in file \"%s\" took %llu us\n", needle,
         filename,
         (unsigned long long)((after > before) ? (after - before)
                                               : ((uint64_t)0)));
}

int main(int argc, char **argv) {
  char *filename;
  char *haystack;
  char *needle;
  char *res;
  size_t s;
  // uint64_t before, after;

  if (argc < 3)
    return 1;
  filename = argv[1];
  needle = argv[2];

  if (!readFile(&haystack, filename))
    return 1;

  s = strlen(haystack);
  if (s < (size_t)1) {
    s = (size_t)1;
  }

  res = (char *)calloc(s, sizeof(char));
  if (res == NULL) {
    free(haystack);
    return 1;
  }

  testNaive(filename, s, res, haystack, needle);
  testRK(filename, s, res, haystack, needle);
  testKMP(filename, s, res, haystack, needle);

  free(haystack);
  free(res);

  return 0;
}