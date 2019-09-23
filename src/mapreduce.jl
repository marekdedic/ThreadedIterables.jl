export tmapreduce, maptreduce, tmaptreduce;

"""
    tmapreduce(f::Function, op::Function, itr::AbstractArray; init)

Multi-threaded version of [mapreduce(f, op, itr; init)](https://docs.julialang.org/en/v1.1/base/collections/#Base.mapreduce-Tuple{Any,Any,Any}). Only the **mapping** part is parallelised.
"""
function tmapreduce(f::Function, op::Function, itr...; init)
	return reduce(op, tmap(f, itr...); init = init);
end

"""
    tmapreduce(f::Function, op::Function, itr::AbstractArray)

Multi-threaded version of [mapreduce(f, op, itr)](https://docs.julialang.org/en/v1.1/base/collections/#Base.mapreduce-Tuple{Any,Any,Any}). Only the **mapping** part is parallelised.
"""
function tmapreduce(f::Function, op::Function, itr...)
	return reduce(op, tmap(f, itr...));
end

"""
    maptreduce(f::Function, op::Function, itr::AbstractArray; init)

Multi-threaded version of [mapreduce(f, op, itr; init)](https://docs.julialang.org/en/v1.1/base/collections/#Base.mapreduce-Tuple{Any,Any,Any}). Only the **reduction** part is parallelised. Note that function `op` must **not** change type!
"""
function maptreduce(f::Function, op::Function, itr...; init)
	return treduce(op, map(f, itr...); init = init);
end

"""
    maptreduce(f::Function, op::Function, itr::AbstractArray)

Multi-threaded version of [mapreduce(f, op, itr)](https://docs.julialang.org/en/v1.1/base/collections/#Base.mapreduce-Tuple{Any,Any,Any}). Only the **reduction** part is parallelised. Note that function `op` must **not** change type!
"""
function maptreduce(f::Function, op::Function, itr...)
	return treduce(op, map(f, itr...));
end

"""
    tmaptreduce(f::Function, op::Function, itr::AbstractArray; init)

Multi-threaded version of [mapreduce(f, op, itr; init)](https://docs.julialang.org/en/v1.1/base/collections/#Base.mapreduce-Tuple{Any,Any,Any}). Both the **mapping** and the **reduction** part is parallelised. Note that function `op` must **not** change type!
"""
function tmaptreduce(f::Function, op::Function, itr...; init)
	return treduce(op, tmap(f, itr...); init = init);
end

"""
    tmaptreduce(f::Function, op::Function, itr::AbstractArray)

Multi-threaded version of [mapreduce(f, op, itr)](https://docs.julialang.org/en/v1.1/base/collections/#Base.mapreduce-Tuple{Any,Any,Any}). Both the **mapping** and the **reduction** part is parallelised. Note that function `op` must **not** change type!
"""
function tmaptreduce(f::Function, op::Function, itr...)
	return treduce(op, tmap(f, itr...));
end
