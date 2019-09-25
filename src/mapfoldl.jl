export tmapfoldl;

"""
    tmapfoldl(f::Function, op::Function, itr::AbstractArray; init)::AbstractArray

Multi-threaded version of [mapfoldl(f, op, itr; init)](https://docs.julialang.org/en/v1.2/base/collections/#Base.mapfoldl-Tuple{Any,Any,Any}). Only the **mapping** part is parallelised.
"""
function tmapfoldl(f::Function, op::Function, itr::T; init) where T<:AbstractArray
	return foldl(op, tmap(f, itr); init = init);
end

"""
    tmapfoldl(f::Function, op::Function, itr::AbstractArray)::AbstractArray

Multi-threaded version of [mapfoldl(f, op, itr)](https://docs.julialang.org/en/v1.2/base/collections/#Base.mapfoldl-Tuple{Any,Any,Any}). Only the **mapping** part is parallelised.
"""
function tmapfoldl(f::Function, op::Function, itr::T) where T<:AbstractArray
	return foldl(op, tmap(f, itr));
end
