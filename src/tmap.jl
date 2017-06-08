export tmap, tmap!;

function tmap{T<:Union{AbstractArray, Associative}}(f::Function, c::T)::T
	d = deepcopy(c);
	tmap!(f, d);
	return d;
end

function tmap!(f::Function, c::Vector)::Void # TODO: Generalise
	Threads.@threads for i in 1:length(c)
		c[i] = f(c[i]);
	end
end

function tmap!{T<:Union{AbstractArray, Associative}}(f::Function, d::T, c::T)::Void
	d = deepcopy(c);
	tmap!(f, d);
end
