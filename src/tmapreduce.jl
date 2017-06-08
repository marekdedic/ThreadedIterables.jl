export tmapreduce;

function tmapreduce{T<:Union{AbstractArray, Associative}}(f::Function, op::Function, v0, itr::T)
	return reduce(op, v0, tmap(f, itr));
end

function tmapreduce{T<:Union{AbstractArray, Associative}}(f::Function, op::Function, itr::T)
	return reduce(op, tmap(f, itr));
end
