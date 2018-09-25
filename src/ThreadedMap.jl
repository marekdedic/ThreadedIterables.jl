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
@deprecate tmapreduce(f::Function, op::Function, v0, itr::T) where T<:AbstractArray tmapreduce(f, op, itr; init = v0) ;
@deprecate maptreduce(f::Function, op::Function, v0, itr::T) where T<:AbstractArray maptreduce(f, op, itr; init = v0) ;
@deprecate tmaptreduce(f::Function, op::Function, v0, itr::T) where T<:AbstractArray tmaptreduce(f, op, itr; init = v0) ;

end
