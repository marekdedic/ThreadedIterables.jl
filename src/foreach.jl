export tforeach;

"""
	tforeach(f::Function, c::AbstractArray)::Void

Multi-threaded version of [foreach(f, c)](https://docs.julialang.org/en/stable/stdlib/collections/#Base.foreach). Currently only supports a single collection.
"""
function tforeach{T<:AbstractArray}(f::Function, c::T)::Void
	Threads.@threads for i in eachindex(c)
		f(c[i]);
	end
end
