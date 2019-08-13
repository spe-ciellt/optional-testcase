//
// Example code to show how CppUTest fails to compile with <optional>.
//
// (C) 2019, Ciellt AB/Stefan Petersen, spe@ciellt.se
//

#ifndef EXAMPLE_HPP
#define EXAMPLE_HPP

#include <optional>

namespace outer {
    class example_t {
    public:
        example_t() { }
        example_t(example_t &) = delete;
        example_t& operator=(const example_t&) = delete;
        // Implicit not movable

        std::optional<uint8_t> next_unconnected(void)
        {
            return std::nullopt;
        }
    private:
    };
}

#endif // EXAMPLE_HPP
