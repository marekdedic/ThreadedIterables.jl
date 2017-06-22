module ThreadedMap

include("foreach.jl");
include("map.jl");
include("mapreduce.jl");
include("mapfoldl.jl");
include("mapfoldr.jl");
include("reduce.jl");

@deprecate tmap!{T<:AbstractArray}(f::Function, collection::T) tmap!(f, collection, collection)

end
