# Getting started

## Using a macro

The simplest way to use the package is the `@threaded` macro, which converts the expression following it into a multi-threaded one.

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

The macro converts all supported functions in the expression, so in the following example, both of the maps will be multi-threaded:
```julia
julia> using ThreadedIterables

julia> a = rand(1:10, 4)
4-element Array{Int64,1}:
 1
 5
 2
 3

julia> @threaded map(x -> x + 1, map(x -> 2x, a))
4-element Array{Int64,1}:
  3
 11
  5
  7
```

## Using a function

If you want a more fine-grained control over which functions get converted, you can use the multi-threaded functions from this package manually. For a list of all the supported functions, see the reference.

In this example, only the outer map will be multi-threaded:
```julia
julia> using ThreadedIterables

julia> a = rand(1:10, 4)
4-element Array{Int64,1}:
 1
 5
 2
 3

julia> tmap(x -> x + 1, map(x -> 2x, a))
4-element Array{Int64,1}:
  3
 11
  5
  7
```
