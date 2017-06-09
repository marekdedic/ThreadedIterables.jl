export tmapreduce, maptreduce, tmaptreduce;

function tmapreduce{T<:AbstractArray}(f::Function, op::Function, v0, itr::T)
	return reduce(op, v0, tmap(f, itr));
end

function tmapreduce{T<:AbstractArray}(f::Function, op::Function, itr::T)
	return reduce(op, tmap(f, itr));
end

function maptreduce{T<:AbstractArray}(f::Function, op::Function, v0, itr::T)
	return treduce(op, v0, map(f, itr));
end

function maptreduce{T<:AbstractArray}(f::Function, op::Function, itr::T)
	return treduce(op, map(f, itr));
end

function tmaptreduce{T<:AbstractArray}(f::Function, op::Function, v0, itr::T)
	return treduce(op, v0, tmap(f, itr));
end

function tmaptreduce{T<:AbstractArray}(f::Function, op::Function, itr::T)
	return treduce(op, tmap(f, itr));
end
