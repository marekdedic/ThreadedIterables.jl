export tmapfoldr;

"""
    tmapfoldr(f::Function, op::Function, itr::AbstractArray; init)::AbstractArray

Multi-threaded version of [mapfoldr(f, op, itr; init)](https://docs.julialang.org/en/v0.7.0/base/collections/#Base.mapfoldr-Tuple{Any,Any,Any}). Only the **mapping** part is parallelised.
"""
function tmapfoldr(f::Function, op::Function, itr::T; init) where T<:AbstractArray
	return foldr(op, tmap(f, itr); init = init);
end

"""
    tmapfoldr(f::Function, op::Function, itr::AbstractArray)::AbstractArray

Multi-threaded version of [mapfoldr(f, op, itr)](https://docs.julialang.org/en/v0.7.0/base/collections/#Base.mapfoldr-Tuple{Any,Any,Any}). Only the **mapping** part is parallelised.
"""
function tmapfoldr(f::Function, op::Function, itr::T) where T<:AbstractArray
	return foldr(op, tmap(f, itr));
end
