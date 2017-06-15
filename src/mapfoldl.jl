export tmapfoldl;

"""
    tmapfoldl(f::Function, op::Function, v0, itr::AbstractArray)::AbstractArray

Multi-threaded version of [mapfoldl(f, op, v0, itr)](https://docs.julialang.org/en/stable/stdlib/collections/#Base.mapfoldl). Only the **mapping** part is parallelised.
"""
function tmapfoldl{T<:AbstractArray}(f::Function, op::Function, v0, itr::T)
	return foldl(op, v0, tmap(f, itr));
end

"""
    tmapfoldl(f::Function, op::Function, itr::AbstractArray)::AbstractArray

Multi-threaded version of [mapfoldl(f, op, itr)](https://docs.julialang.org/en/stable/stdlib/collections/#Base.mapfoldl). Only the **mapping** part is parallelised.
"""
function tmapfoldl{T<:AbstractArray}(f::Function, op::Function, itr::T)
	return foldl(op, tmap(f, itr));
end
