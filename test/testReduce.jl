function testTreduce1()::Bool
	arr = randArray();
	init = randInit();
	return reduce(+, arr; init = init) == treduce(+, arr; init = init);
end

function testTreduce1Empty()::Bool
	init = randInit();
	return reduce(+, []; init = init) == treduce(+, []; init = init);
end

function testTreduce2()::Bool
	arr = randArray();
	return reduce(+, arr) == treduce(+, arr);
end

function testTreduce2Empty()
	treduce(identity, []);
end
