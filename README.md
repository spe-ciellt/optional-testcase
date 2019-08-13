# CppUTest fails to compile with `std::optional` included

**Update**

I finally managed to compile this thing by adding a variable in
the `Makefile`:
```
CPPUTEST_USE_MEM_LEAK_DETECTION = N
```

Not ideal if you want to do memory leak detection *AND* use `std::optional`.

**Original text from here**

This is a minimal test case to show that I can't compile with
`optional` when running under CppUTest framework.

If `-std=c++17` is missing, it can't find `std::optional<>()`:
```
error: ‘optional’ in namespace ‘std’ does not name a template type
         std::optional<uint8_t> next_unconnected(void)
```

If `-std=c++17` is added to `CPPUTEST_CXXFLAGS`:
```
                from AllTests/exampleTest.cpp:7:
/usr/include/c++/7/optional: In member function ‘void std::_Optional_payload<_Tp, false, false>::_M_construct(_Args&& ...)’:
/usr/include/c++/7/optional:225:18: error: expected type-specifier before ‘(’ token
           ::new ((void *) std::__addressof(this->_M_payload))
                  ^
/usr/include/c++/7/optional:225:18: error: expected ‘)’ before ‘(’ token
/usr/include/c++/7/optional:225:19: error: expected primary-expression before ‘void’
           ::new ((void *) std::__addressof(this->_M_payload))
                   ^~~~
/usr/include/c++/7/optional: In member function ‘void std::_Optional_payload<_Tp, false, true>::_M_construct(_Args&& ...)’:
/usr/include/c++/7/optional:283:18: error: expected type-specifier before ‘(’ token
           ::new ((void *) std::__addressof(this->_M_payload))
                  ^
/usr/include/c++/7/optional:283:18: error: expected ‘)’ before ‘(’ token
/usr/include/c++/7/optional:283:19: error: expected primary-expression before ‘void’
           ::new ((void *) std::__addressof(this->_M_payload))
                   ^~~~
/usr/include/c++/7/optional: In member function ‘void std::_Optional_base<_Tp>::_M_construct(_Args&& ...)’:
/usr/include/c++/7/optional:404:18: error: expected type-specifier
           ::new (std::__addressof(this->_M_payload._M_payload))
                  ^~~
/usr/include/c++/7/optional:404:18: error: expected ‘)’

```

## Compilation string
```
g++ -std=c++17 -g -Wall -Wextra -Werror -Wshadow -Wswitch-default -Wswitch-enum -Wconversion -pedantic-errors -Wsign-conversion -Woverloaded-virtual -include /usr/include/CppUTest/MemoryLeakDetectorNewMacros.h  -DCPPUTEST_COMPILATION -Wall -Wextra -Werror -Wshadow -Wswitch-default -Wswitch-enum -Wconversion -pedantic-errors -Wsign-conversion -include /usr/include/CppUTest/MemoryLeakDetectorMallocMacros.h  -I/home/spe/customer/loligo/saab/hdlc/optional-testcase/src  -IAllTests  -I/usr/include    -c -MMD -MP -o objs/x86_64-linux-gnu/AllTests/exampleTest.o AllTests/exampleTest.cpp
```

## Setup


The following setup was used on Ubuntu 18.04.1 LTS:
* gcc (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0
* cpputest 3.8-7 (apt install cpputest)
