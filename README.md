# Threaded.jl

[![CircleCI](https://img.shields.io/circleci/build/github/marekdedic/Threaded.jl/master.svg)](https://circleci.com/gh/marekdedic/Threaded.jl/tree/master) [![Codecov branch](https://img.shields.io/codecov/c/github/marekdedic/Threaded.jl/master.svg)](https://codecov.io/gh/marekdedic/Threaded.jl/branch/master) [![Stable docs](https://img.shields.io/badge/docs-stable-blue.svg)](https://marekdedic.github.io/Threaded.jl/stable/) [![Latest docs](https://img.shields.io/badge/docs-latest-blue.svg)](https://marekdedic.github.io/Threaded.jl/latest/)

This package adds multi-threaded versions of functions operating on collections. Currently, the package contains the functions `foreach`, `map`, `reduce`, `mapreduce`, `mapfoldl`, `mapfoldr`.

The simplest way to use the package id the `@threaded macro`, which converts all the supported functions in the expression to their multi-threaded equivalents.

```julia

julia> using Threaded

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
