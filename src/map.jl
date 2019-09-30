export tmap, tmap!;

"""
    tmap(f::Function, c::AbstractArray)::AbstractArray

Multi-threaded version of [map(f, c)](https://docs.julialang.org/en/v1.2/base/collections/#Base.map).
"""

function tmap(f::Function, c...)
	ensureThreaded();
	if !all(i->length(i) == length(c[1]), c)
		throw(DimensionMismatch("dimensions must match"));
	end
	n = Threads.nthreads();
	tmp = Vector{Any}(undef, n);
	ind = eachindex(c[1]);
	len = length(ind);
	Threads.@threads for i in 1:n
		start = fld(len * (i - 1), n) + firstindex(ind);
		stop = fld(len * i, n) + firstindex(ind) - 1;
		if start > stop
			tmp[i] = missing;
			continue;
		end
		first = f(getindex.(c, ind[start])...);
		T = typeof(first)
		tmp[i] = similar(Vector{T}, stop - start + 1);
		tmp[i][1] = first;
		for j in 2:length(tmp[i])
			value = f(getindex.(c, ind[start + j - 1])...)
			if !(typeof(value) isa T) && typeof(value) !== T
				newArray = similar(tmp[i], promote_type(eltype(tmp[i]), typeof(value)));
				copyto!(newArray, 1, tmp[i], 1, j);
				tmp[i] = newArray;
			end
			tmp[i][j] = value;
		end
	end
	tmp = filter(x->!ismissing(x), tmp);
	ret = similar(c[1], promote_type(eltype.(tmp)...));
	j = firstindex(ret);
	for i in 1:length(tmp)
		jj = j + length(tmp[i]);
		copyto!(ret, ind[j], tmp[i], 1);
		j = jj;
	end
	return ret;
end

"""
    tmap!(f::Function, destination::AbstractArray, collection::AbstractArray)::Nothing

Multi-threaded version of [map!(f, destination, collection)](https://docs.julialang.org/en/v1.2/base/collections/#Base.map!).
"""
function tmap!(f::Function, destination::T, collection...)::T where T<:AbstractArray
	ensureThreaded();
	typ = eltype(destination);
	dind = eachindex(destination);
	cind = minimum(eachindex.(collection));
	Threads.@threads for i in 1:length(cind);
		destination[dind[i]] = convert(typ, f(getindex.(collection, cind[i])...));
	end
	return destination;
end
