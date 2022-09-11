# tarai

Codes for benchmarks in personaly interest.

Modified by NABETANI Takenori.

Target machine is MacBook Pro (14inch, 2021) including Apple M1 Pro (non-MAX)

# result

```
time bin/tarai-gcc 15 7 0
tarai(15, 7, 0) = 15
        4.10 real         4.08 user         0.00 sys
time bin/tarai-clang 15 7 0
tarai(15, 7, 0) = 15
        3.56 real         3.55 user         0.00 sys
time bin/tarai-go 15 7 0
tarai(15, 7, 0) = 15
        4.09 real         4.08 user         0.00 sys
time bin/tarai-zig 15 7 0
tarai(15, 7, 0) = 15
        3.40 real         3.39 user         0.00 sys
time bin/tarai-zig_x64 15 7 0
tarai(15, 7, 0) = 15
        5.07 real         5.06 user         0.00 sys
time bin/tarai-rust 15 7 0
tarai(15, 7, 0) = 15
        3.40 real         3.40 user         0.00 sys
```
