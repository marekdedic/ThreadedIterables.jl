export tmapfoldl;

function tmapfoldl{T<:AbstractArray}(f::Function, op::Function, v0, itr::T)
	return foldl(op, v0, tmap(f, itr));
end

function tmapfoldl{T<:AbstractArray}(f::Function, op::Function, itr::T)
	return foldl(op, tmap(f, itr));
end
