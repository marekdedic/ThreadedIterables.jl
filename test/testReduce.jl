function testTreduce1()::Bool
	arr = randArray();
	init = randInit();
	return reduce(+, arr; init = init) == treduce(+, arr; init = init);
end


function testTreduce2()::Bool
	arr = randArray();
	return reduce(+, arr) == treduce(+, arr);
end
