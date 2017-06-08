export tforeach;

function tforeach{T<:AbstractArray}(f::Function, c::T)::Void
	Threads.@threads for i in eachindex(c)
		f(c[i]);
	end
end
