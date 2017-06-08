export tmapfoldr;

function tmapfoldr{T<:AbstractArray}(f::Function, op::Function, v0, itr::T)
	return foldr(op, v0, tmap(f, itr));
end

function tmapfoldr{T<:AbstractArray}(f::Function, op::Function, itr::T)
	return foldr(op, tmap(f, itr));
end
