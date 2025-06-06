#include <string>
#include "repeat.hpp"

namespace rep {

std::string repeat(std::string& in, int count) {
    std::string out;
    for (int i = 0; i < count; i += 1) {
        out.append(in);
    }
    return out;
}

}
