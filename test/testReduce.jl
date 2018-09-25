function testTreduce1()::Bool
	arr = rand(1:1000, rand(1:10, rand(1:4))...);
	return reduce(+, arr; init = 0) == treduce(+, arr; init = 0);
end


function testTreduce2()::Bool
	arr = rand(1:1000, rand(1:10, rand(1:4))...);
	return reduce(+, arr) == treduce(+, arr);
end
