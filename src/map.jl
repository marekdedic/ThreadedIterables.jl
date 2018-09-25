export tmap, tmap!;

"""
    tmap(f::Function, c::AbstractArray)::AbstractArray

Multi-threaded version of [map(f, c)](https://docs.julialang.org/en/stable/stdlib/collections/#Base.map). Currently only supports a single collection.
"""
function tmap(f::Function, c::T) where T<:AbstractArray
	ensureThreaded();
	ret = similar(c, Any);
	Threads.@threads for i in eachindex(c)
		ret[i] = f(c[i]);
	end
	return reshape([ret...],size(ret)...);
end

"""
    tmap!(f::Function, destination::AbstractArray, collection::AbstractArray)::Nothing

Multi-threaded version of [map!(f, destination, collection)](https://docs.julialang.org/en/stable/stdlib/collections/#Base.map!). Currently only supports a single collection.
"""
function tmap!(f::Function, destination::T, collection::U)::Nothing where {T<:AbstractArray, U<:AbstractArray}
	ensureThreaded();
	typ = eltype(destination);
	dind = eachindex(destination);
	cind = eachindex(collection);
	Threads.@threads for i in 1:length(cind);
		destination[dind[i]] = convert(typ, f(collection[cind[i]]));
	end
end
