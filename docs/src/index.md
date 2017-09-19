# ThreadedMap.jl Documentation

This package implements Multi-threaded variants of the mapping functions (currently `foreach`, `map`, `reduce`, `mapreduce`, `mapfoldl` and `mapfoldr`) in Julia. See the reference for details about the individual functions provided by this package.

Note that when using this package, the responsibility for preventing race conditions lies with the user.

**Warning:** Multi-threading in Julia is an experimental feature, use with caution. Crashes may occur quite frequently and are not caused by this package. A known bug in Julia 0.5.X is that when there is an exception in the multi-threaded code, no error message is shown in the REPL. This has been fixed in Julia 0.6.
