function templateTestTreduce1(arr::AbstractArray)::Bool
	init = randInit();
	return reduce(+, arr; init = init) == treduce(+, arr; init = init);
end

function testTreduce1()::Bool
	return templateTestTreduce1(randArray());
end

function testTreduce1Empty()::Bool
	return templateTestTreduce1([]);
end

#####

function templateTestTreduce2(arr::AbstractArray)::Bool
	return reduce(+, arr) == treduce(+, arr);
end

function testTreduce2()::Bool
	templateTestTreduce2(randArray());
end

function testTreduce2Empty()
	treduce(identity, []);
end
