#include <cstdint>
#include "repeat.hpp"

#if _MSC_VER
    #define COBOL_EXPORT __stdcall
#else
    #define COBOL_EXPORT
#endif

extern "C" {

void COBOL_EXPORT rep_repeat_cobol(
    const char* in, int32_t* in_len, int32_t* count, char* out, int32_t* out_len
) {
    std::string in_string{in, static_cast<std::string::size_type>(*in_len)};
    std::string out_string = ::rep::repeat(in_string, *count);
    out_string.copy(out, *out_len);
    // TODO Pad with space?
}

}
