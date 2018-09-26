export tforeach;

"""
	tforeach(f::Function, c::AbstractArray)::Nothing

Multi-threaded version of [foreach(f, c)](https://docs.julialang.org/en/v0.7.0/base/collections/#Base.foreach). Currently only supports a single collection.
"""
function tforeach(f::Function, c::T)::Nothing where T<:AbstractArray
	ensureThreaded();
	Threads.@threads for i in eachindex(c)
		f(c[i]);
	end
end
