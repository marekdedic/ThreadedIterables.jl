module ThreadedMap

include("ensureThreaded.jl")

include("foreach.jl");
include("map.jl");
include("mapreduce.jl");
include("mapfoldl.jl");
include("mapfoldr.jl");
include("reduce.jl");

@deprecate tmap!(f::Function, collection::T) where T<:AbstractArray tmap!(f, collection, collection);
@deprecate treduce(op::Function, v0, itr::T) where T<:AbstractArray treduce(op, itr; init = v0) ;

end
