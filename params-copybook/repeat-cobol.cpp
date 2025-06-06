#include "repeat.hpp"

extern "C" {

void rep_repeat_cobol(
    const char* in, int* in_len, int* count, char* out, int* out_len
) {
    std::string in_string{in, static_cast<std::string::size_type>(*in_len)};
    std::string out_string = ::rep::repeat(in_string, *count);
    out_string.copy(out, *out_len);
    // TODO Pad with space?
}

}
