export treduce;

"""
    treduce(op::Function, itr::AbstractArray; init)

Multi-threaded version of [reduce(op, itr; init)](https://docs.julialang.org/en/v1.1/base/collections/#Base.reduce-Tuple{Any,Any}). Note that function `op` must **not** change type!
"""
function treduce(op::Function, itr::T; init) where T<:AbstractArray
	ensureThreaded();
	n = Threads.nthreads();
	tmp = Vector{Any}(undef, n);
	ind = eachindex(itr);
	len = length(ind);
	if len > n
		Threads.@threads for i in 1:n
			start = fld(len * (i - 1), n) + 1;
			stop = fld(len * i, n);
			if i == 1
				localInit = reduce(op, itr[ind[start:start]]; init = init);
			else
				localInit = reduce(op, itr[ind[start:start]]);
			end
			tmp[i] = reduce(op, itr[ind[nextind(ind, start):stop]]; init = localInit);
		end
	else
		tmp = itr;
		tmp[firstindex(tmp)] = reduce(op, tmp[firstindex(tmp):firstindex(tmp)]; init = init);
		n = len;
	end
	tmp2 = Vector{Any}(undef, cld(n, 2));
	while n > 1
		nn = cld(n, 2);
		Threads.@threads for j in 1:nn
			stop = min(2j, n);
			localInit = reduce(op, tmp[2j - 1]);
			tmp2[j] = reduce(op, tmp[2j:stop]; init = localInit);
		end
		n = nn;
		tmp = tmp2
	end
	return tmp[1];
end

"""
    treduce(op::Function, itr::AbstractArray)

Multi-threaded version of [reduce(op, itr)](https://docs.julialang.org/en/v1.1/base/collections/#Base.reduce-Tuple{Any,Any}). Note that function `op` must **not** change type!
"""
function treduce(op::Function, itr::T) where T<:AbstractArray
	ensureThreaded();
	n = Threads.nthreads();
	tmp = Vector{Any}(undef, n);
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
	tmp2 = Vector{Any}(undef, cld(n, 2));
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
