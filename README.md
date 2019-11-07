# ThreadedIterables.jl

[![CircleCI](https://img.shields.io/circleci/build/github/marekdedic/ThreadedIterables.jl/master.svg)](https://circleci.com/gh/marekdedic/ThreadedIterables.jl/tree/master) [![Codecov branch](https://img.shields.io/codecov/c/github/marekdedic/ThreadedIterables.jl/master.svg)](https://codecov.io/gh/marekdedic/ThreadedIterables.jl/branch/master) [![Stable docs](https://img.shields.io/badge/docs-stable-blue.svg)](https://marekdedic.github.io/ThreadedIterables.jl/stable/) [![Latest docs](https://img.shields.io/badge/docs-latest-blue.svg)](https://marekdedic.github.io/ThreadedIterables.jl/latest/)

This package adds multi-threaded versions of functions operating on collections. Currently, the package contains the functions `foreach`, `map`, `reduce`, `mapreduce`, `mapfoldl`, `mapfoldr`.

The simplest way to use the package is the `@threaded` macro, which converts all the supported functions in the expression to their multi-threaded equivalents.

Example:
```julia

julia> using ThreadedIterables

julia> a = rand(1:10, 4)
4-element Array{Int64,1}:
  4
  7
 10
  7

julia>@threaded map(x -> 2x, a)
4-element Array{Int64,1}:
  8
 14
 20
 14
```

Alternatively, the multi-threaded functions can be used directly - `tforeach` instead of `foreach`, `tmap` instead of `map` etc. Note that for `mapreduce`, there are actually 3 options: `tmapreduce`, `maptreduce` and `tmaptreduce`. These functions differ in whether the mapping part, the reduction part, or both of them are multi-threaded.
