export treduce;

"""
    treduce(op::Function, v0, itr::AbstractArray)

Multi-threaded version of [reduce(op, v0, itr)](https://docs.julialang.org/en/stable/stdlib/collections/#Base.reduce).
"""
function treduce{T<:AbstractArray}(op::Function, v0, itr::T)
	n = Threads.nthreads();
	tmp = Vector{Any}(n);
	ind = eachindex(itr);
	len = length(ind);
	if len > n
		Threads.@threads for i in 1:n
			start = fld(len * (i - 1), n) + 1;
			stop = fld(len * i, n);
			tmp[i] = reduce(op, v0, itr[ind[start:stop]]);
		end
	else
		tmp = itr;
		n = len;
	end
	tmp2 = Vector{Any}(cld(n, 2));
	while n > 1
		nn = cld(n, 2);
		Threads.@threads for j in 1:nn
			stop = min(2j, n);
			tmp2[j] = reduce(op, v0, tmp[2j - 1:stop]);
		end
		n = nn;
		tmp = tmp2
	end
	return tmp[1];
end

"""
    treduce(op::Function, itr::AbstractArray)

Multi-threaded version of [reduce(op, itr)](https://docs.julialang.org/en/stable/stdlib/collections/#Base.reduce).
"""
function treduce{T<:AbstractArray}(op::Function, itr::T)
	n = Threads.nthreads();
	tmp = Vector{Any}(n);
	ind = eachindex(itr);
	len = length(ind);
	if len > n
		Threads.@threads for i in 1:n
			start = fld(len * (i - 1), n) + 1;
			stop = fld(len * i, n);
			tmp[i] = reduce(op, itr[ind[start:stop]]);
		end
	else
		tmp = itr;
		n = len;
	end
	tmp2 = Vector{Any}(cld(n, 2));
	while n > 1
		nn = cld(n, 2);
		Threads.@threads for j in 1:nn
			stop = min(2j, n);
			tmp2[j] = reduce(op, tmp[2j - 1:stop]);
		end
		n = nn;
		tmp = tmp2
	end
	return tmp[1];
end
