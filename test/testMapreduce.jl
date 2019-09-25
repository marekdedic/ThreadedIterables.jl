function testTmapreduce1Stable()::Bool
	arr = randArray();
	init = randInit();
	return mapreduce(x->2x, +, arr; init = init) == tmapreduce(x->2x, +, arr; init = init);
end

function testTmapreduce1Unstable()::Bool
	arr = randStrArray();
	str = lipsum();
	init = randstring(rand(1:1000));
	return mapreduce(x->str[1:x], *, arr; init = init) == tmapreduce(x->str[1:x], *, arr; init = init);
end

function testTmapreduce1StableMultiple()::Bool
	arr1, arr2 = rand2Arrays();
	init = randInit();
	return mapreduce((x, y)->2x + 3y, +, arr1, arr2; init = init) == tmapreduce((x, y)->2x + 3y, +, arr1, arr2; init = init);
end

function testTmapreduce1UnstableMultiple()::Bool
	arr1, arr2 = rand2StrArrays();
	str = lipsum();
	init = randstring(rand(1:1000));
	return mapreduce((x, y)->str[1:x + y], *, arr1, arr2; init = init) == tmapreduce((x, y)->str[1:x + y], *, arr1, arr2; init = init);
end

function testTmapreduce2Stable()::Bool
	arr = randArray();
	return mapreduce(x->2x, +, arr) == tmapreduce(x->2x, +, arr);
end

function testTmapreduce2Unstable()::Bool
	arr = randStrArray();
	str = lipsum();
	return mapreduce(x->str[1:x], *, arr) == tmapreduce(x->str[1:x], *, arr);
end

function testTmapreduce2StableMultiple()::Bool
	arr1, arr2 = rand2Arrays();
	return mapreduce((x, y)->2x + 3y, +, arr1, arr2) == tmapreduce((x, y)->2x + 3y, +, arr1, arr2);
end

function testTmapreduce2UnstableMultiple()::Bool
	arr1, arr2 = rand2StrArrays();
	str = lipsum();
	return mapreduce((x, y)->str[1:x + y], *, arr1, arr2) == tmapreduce((x, y)->str[1:x + y], *, arr1, arr2);
end

function testMaptreduce1()::Bool
	arr = randArray();
	init = randInit();
	return mapreduce(x->2x, +, arr; init = init) == maptreduce(x->2x, +, arr; init = init);
end

function testMaptreduce1Multiple()::Bool
	arr1, arr2 = rand2Arrays();
	init = randInit();
	return mapreduce((x, y)->2x + 3y, +, arr1, arr2; init = init) == maptreduce((x, y)->2x + 3y, +, arr1, arr2; init = init);
end

function testMaptreduce2()::Bool
	arr = randArray();
	return mapreduce(x->2x, +, arr) == maptreduce(x->2x, +, arr);
end

function testMaptreduce2Multiple()::Bool
	arr1, arr2 = rand2Arrays();
	return mapreduce((x, y)->2x + 3y, +, arr1, arr2) == maptreduce((x, y)->2x + 3y, +, arr1, arr2);
end

function testTmaptreduce1()::Bool
	arr = randArray();
	init = randInit();
	return mapreduce(x->2x, +, arr; init = init) == tmaptreduce(x->2x, +, arr; init = init);
end

function testTmaptreduce1Multiple()::Bool
	arr1, arr2 = rand2Arrays();
	init = randInit();
	return mapreduce((x, y)->2x + 3y, +, arr1, arr2; init = init) == tmaptreduce((x, y)->2x + 3y, +, arr1, arr2; init = init);
end

function testTmaptreduce2()::Bool
	arr = randArray();
	return mapreduce(x->2x, +, arr) == tmaptreduce(x->2x, +, arr);
end

function testTmaptreduce2Multiple()::Bool
	arr1, arr2 = rand2Arrays();
	return mapreduce((x, y)->2x + 3y, +, arr1, arr2) == tmaptreduce((x, y)->2x + 3y, +, arr1, arr2);
end
