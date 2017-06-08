export tmap, tmap!;

function tmap{T<:AbstractArray}(f::Function, c::T)
	ret = similar(c, Any);
	Threads.@threads for i in eachindex(c)
		ret[i] = f(c[i]);
	end
	return reshape([ret...],size(ret)...);
end

function tmap!{T<:AbstractArray}(f::Function, c::T)::Void
	const typ = eltype(c);
	Threads.@threads for i in eachindex(c)
		c[i] = convert(typ, f(c[i]));
	end
end

function tmap!{T<:AbstractArray, U<:AbstractArray}(f::Function, d::T, c::U)::Void
	const typ = eltype(d);
	Threads.@threads for i in eachindex(c)
		d[i] = convert(typ, f(c[i]));
	end
end
