#include <stdlib.h>
#include <string.h>

extern "C" {

void repeat_string(
    const char* in, int* in_len, int* n, char* out, int* out_len
) {
    out[0] = '\0';
    for (int i = 0; i < *n; i++) {
        // TODO Track size along the way and truncate final.
        if ((strlen(out) + strlen(in)) >= *out_len - 1) break;
        strncat(out, in, *in_len);
    }
}

}
