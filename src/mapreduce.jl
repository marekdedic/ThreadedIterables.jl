export tmapreduce, maptreduce, tmaptreduce;

"""
    tmapreduce(f::Function, op::Function, v0, itr::AbstractArray)

Multi-threaded version of [mapreduce(f, op, v0, itr)](https://docs.julialang.org/en/stable/stdlib/collections/#Base.mapreduce). Only the **mapping** part is parallelised.
"""
function tmapreduce{T<:AbstractArray}(f::Function, op::Function, v0, itr::T)
	return reduce(op, v0, tmap(f, itr));
end

"""
    tmapreduce(f::Function, op::Function, itr::AbstractArray)

Multi-threaded version of [mapreduce(f, op, itr)](https://docs.julialang.org/en/stable/stdlib/collections/#Base.mapreduce). Only the **mapping** part is parallelised.
"""
function tmapreduce{T<:AbstractArray}(f::Function, op::Function, itr::T)
	return reduce(op, tmap(f, itr));
end

"""
    maptreduce(f::Function, op::Function, v0, itr::AbstractArray)

Multi-threaded version of [mapreduce(f, op, v0, itr)](https://docs.julialang.org/en/stable/stdlib/collections/#Base.mapreduce). Only the **reduction** part is parallelised. Note that function `op` must **not** change type!
"""
function maptreduce{T<:AbstractArray}(f::Function, op::Function, v0, itr::T)
	return treduce(op, v0, map(f, itr));
end

"""
    maptreduce(f::Function, op::Function, itr::AbstractArray)

Multi-threaded version of [mapreduce(f, op, itr)](https://docs.julialang.org/en/stable/stdlib/collections/#Base.mapreduce). Only the **reduction** part is parallelised. Note that function `op` must **not** change type!
"""
function maptreduce{T<:AbstractArray}(f::Function, op::Function, itr::T)
	return treduce(op, map(f, itr));
end

"""
    tmaptreduce(f::Function, op::Function, v0, itr::AbstractArray)

Multi-threaded version of [mapreduce(f, op, v0, itr)](https://docs.julialang.org/en/stable/stdlib/collections/#Base.mapreduce). Both the **mapping** and the **reduction** part is parallelised. Note that function `op` must **not** change type!
"""
function tmaptreduce{T<:AbstractArray}(f::Function, op::Function, v0, itr::T)
	return treduce(op, v0, tmap(f, itr));
end

"""
    tmaptreduce(f::Function, op::Function, itr::AbstractArray)

Multi-threaded version of [mapreduce(f, op, itr)](https://docs.julialang.org/en/stable/stdlib/collections/#Base.mapreduce). Both the **mapping** and the **reduction** part is parallelised. Note that function `op` must **not** change type!
"""
function tmaptreduce{T<:AbstractArray}(f::Function, op::Function, itr::T)
	return treduce(op, tmap(f, itr));
end
