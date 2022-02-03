#include <stddef.h>
#include <stdint.h>

static size_t length(const char *str) {
  size_t l;
  const char *curr;

  for (curr = str, l = (size_t)0; *curr != '\0'; curr++, l++)
    ;
  return l;
}