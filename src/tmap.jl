export tmap, tmap!;

function tmap{T<:AbstractArray}(f::Function, c::T)::T
	d = deepcopy(c);
	tmap!(f, d);
	return d;
end

function tmap!{T<:AbstractArray}(f::Function, c::T)::Void
	Threads.@threads for i in eachindex(c)
		c[i] = f(c[i]);
	end
end

function tmap!{T<:AbstractArray}(f::Function, d::T, c::T)::Void
	d = deepcopy(c);
	tmap!(f, d);
end
