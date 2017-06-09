export treduce;

function treduce{T<:AbstractArray}(op::Function, v0, itr::T)
	n = Threads.nthreads();
	tmp = Vector{Any}(n);
	ind = eachindex(itr);
	len = length(ind);
	Threads.@threads for i in 1:n
		start = fld(len * (i - 1), n) + 1;
		stop = fld(len * i, n);
		tmp[i] = reduce(op, v0, itr[ind[start:stop]]);
	end
	return reduce(op, v0, tmp);
end

function treduce{T<:AbstractArray}(op::Function, itr::T)
	n = Threads.nthreads();
	tmp = Vector{Any}(n);
	ind = eachindex(itr);
	len = length(ind);
	Threads.@threads for i in 1:n
		start = fld(len * (i - 1), n) + 1;
		stop = fld(len * i, n);
		tmp[i] = reduce(op, itr[ind[start:stop]]);
	end
	return reduce(op, tmp);
end
