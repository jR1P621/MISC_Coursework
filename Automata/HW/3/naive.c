#include <stddef.h>
#include <stdint.h>

static void matchStringsDoWorkNaive(char *res, const unsigned char *haystack,
                                    size_t n, const unsigned char *needle,
                                    size_t m) {
  /* TODO */
  for (int s = 0; s < n - m + 1; s++) {
    res[s] = 1;
    for (int t = 0; t < m && res[s] == 1; t++) {
      if (haystack[s + t] != needle[t]) {
        res[s] = 0;
      }
    }
  }
}

void matchStringsNaive(char *res, const char *haystack, const char *needle) {
  matchStringsDoWorkNaive(res, (const unsigned char *)haystack,
                          length(haystack), (const unsigned char *)needle,
                          length(needle));
}