export tmap, tmap!;

"""
    tmap(f::Function, c::AbstractArray)::AbstractArray

Multi-threaded version of [map(f, c)](https://docs.julialang.org/en/stable/stdlib/collections/#Base.map). Currently only supports a single collection.
"""
function tmap{T<:AbstractArray}(f::Function, c::T)
	ensureThreaded();
	ret = similar(c, Any);
	Threads.@threads for i in eachindex(c)
		ret[i] = f(c[i]);
	end
	return reshape([ret...],size(ret)...);
end

"""
    tmap!(f::Function, destination::AbstractArray, collection::AbstractArray)::Void

Multi-threaded version of [map!(f, destination, collection)](https://docs.julialang.org/en/stable/stdlib/collections/#Base.map!). Currently only supports a single collection.
"""
function tmap!{T<:AbstractArray, U<:AbstractArray}(f::Function, destination::T, collection::U)::Void
	ensureThreaded();
	const typ = eltype(destination);
	dind = eachindex(destination);
	cind = eachindex(collection);
	Threads.@threads for i in 1:length(cind);
		destination[dind[i]] = convert(typ, f(collection[cind[i]]));
	end
end
