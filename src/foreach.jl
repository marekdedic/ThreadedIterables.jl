export tforeach;

"""
	tforeach(f::Function, c::AbstractArray)::Nothing

Multi-threaded version of [foreach(f, c)](https://docs.julialang.org/en/v1.1/base/collections/#Base.foreach). Currently only supports a single collection.
"""
function tforeach(f::Function, c...)::Nothing
	ensureThreaded();
	Threads.@threads for i in minimum(eachindex.(c))
		f(getindex.(c, i)...);
	end
end
