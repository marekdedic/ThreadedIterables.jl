export tmapfoldr;

"""
    tmapfoldr(f::Function, op::Function, v0, itr::AbstractArray)::AbstractArray

Multi-threaded version of [mapfoldr(f, op, v0, itr)](https://docs.julialang.org/en/stable/stdlib/collections/#Base.mapfoldr). Only the **mapping** part is parallelised.
"""
function tmapfoldr{T<:AbstractArray}(f::Function, op::Function, v0, itr::T)
	return foldr(op, v0, tmap(f, itr));
end

"""
    tmapfoldr(f::Function, op::Function, itr::AbstractArray)::AbstractArray

Multi-threaded version of [mapfoldr(f, op, itr)](https://docs.julialang.org/en/stable/stdlib/collections/#Base.mapfoldr). Only the **mapping** part is parallelised.
"""
function tmapfoldr{T<:AbstractArray}(f::Function, op::Function, itr::T)
	return foldr(op, tmap(f, itr));
end
