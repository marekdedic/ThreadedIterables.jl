# ThreadedIterables.jl Documentation

This package implements Multi-threaded variants of the mapping functions (currently `foreach`, `map`, `reduce`, `mapreduce`, `mapfoldl` and `mapfoldr`) in Julia. See the reference for details about the individual functions provided by this package.

Note that when using this package, the responsibility for preventing race conditions lies with the user.

**Warning:** Multi-threading in Julia is an experimental feature, use with caution. Crashes may occur quite frequently and are not caused by this package.
