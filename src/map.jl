export tmap, tmap!;

"""
    tmap(f::Function, c::AbstractArray)::AbstractArray

Multi-threaded version of [map(f, c)](https://docs.julialang.org/en/v1.1/base/collections/#Base.map). Currently only supports a single collection.
"""
function tmap(f::Function, c...)
	ensureThreaded();
	if !all(i->length(i) == length(c[1]), c)
		throw(DimensionMismatch("dimensions must match"));
	end
	ret = similar(c[1], Any);
	Threads.@threads for i in eachindex(c[1])
		ret[i] = f(getindex.(c, i)...);
	end
	return reshape([ret...],size(ret)...);
end

"""
    tmap!(f::Function, destination::AbstractArray, collection::AbstractArray)::Nothing

Multi-threaded version of [map!(f, destination, collection)](https://docs.julialang.org/en/v1.1/base/collections/#Base.map!). Currently only supports a single collection.
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
