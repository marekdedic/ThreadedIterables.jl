function templateTestTmapreduce1(arr::AbstractArray)::Bool
	init = randInit();
	return mapreduce(x->2x, +, arr; init = init) == tmapreduce(x->2x, +, arr; init = init);
end

function testTmapreduce1Stable()::Bool
	return templateTestTmapreduce1(randArray());
end

function testTmapreduce1Unstable()::Bool
	arr = randStrArray();
	str = lipsum();
	init = randstring(rand(1:1000));
	return mapreduce(x->str[1:x], *, arr; init = init) == tmapreduce(x->str[1:x], *, arr; init = init);
end

function testTmapreduce1Offset()::Bool
	return templateTestTmapreduce1(offsetArray());
end

function testTmapreduce1Empty()::Bool
	return templateTestTmapreduce1([]);
end

#####

function templateTestTmapreduce1Multiple(arr1::AbstractArray, arr2::AbstractArray)::Bool
	init = randInit();
	return mapreduce((x, y)->2x + 3y, +, arr1, arr2; init = init) == tmapreduce((x, y)->2x + 3y, +, arr1, arr2; init = init);
end

function testTmapreduce1StableMultiple()::Bool
	return templateTestTmapreduce1Multiple(rand2Arrays()...);
end

function testTmapreduce1UnstableMultiple()::Bool
	arr1, arr2 = rand2StrArrays();
	str = lipsum();
	init = randstring(rand(1:1000));
	return mapreduce((x, y)->str[1:x + y], *, arr1, arr2; init = init) == tmapreduce((x, y)->str[1:x + y], *, arr1, arr2; init = init);
end

function testTmapreduce1MultipleOffset()::Bool
	return templateTestTmapreduce1Multiple(offsetArray(), offsetArray());
end

function testTmapreduce1MultipleEmpty()::Bool
	return templateTestTmapreduce1Multiple([], []);
end

#####

function testTmapreduce2Stable()::Bool
	arr = randArray();
	return mapreduce(x->2x, +, arr) == tmapreduce(x->2x, +, arr);
end

function testTmapreduce2Unstable()::Bool
	arr = randStrArray();
	str = lipsum();
	return mapreduce(x->str[1:x], *, arr) == tmapreduce(x->str[1:x], *, arr);
end

function testTmapreduce2Offset()::Bool
	arr = offsetArray();
	return mapreduce(x->2x, +, arr) == tmapreduce(x->2x, +, arr);
end

function testTmapreduce2Empty()
	tmapreduce(x->2x, (x, y)->x, []);
end

#####

function testTmapreduce2StableMultiple()::Bool
	arr1, arr2 = rand2Arrays();
	return mapreduce((x, y)->2x + 3y, +, arr1, arr2) == tmapreduce((x, y)->2x + 3y, +, arr1, arr2);
end

function testTmapreduce2UnstableMultiple()::Bool
	arr1, arr2 = rand2StrArrays();
	str = lipsum();
	return mapreduce((x, y)->str[1:x + y], *, arr1, arr2) == tmapreduce((x, y)->str[1:x + y], *, arr1, arr2);
end

function testTmapreduce2MultipleOffset()::Bool
	arr1 = offsetArray();
	arr2 = offsetArray();
	return mapreduce((x, y)->2x + 3y, +, arr1, arr2) == tmapreduce((x, y)->2x + 3y, +, arr1, arr2);
end

function testTmapreduce2MultipleEmpty()
	tmapreduce((x, y)->2x + 3y, (x, y)->x, [], []);
end

#####

function templateTestMaptreduce1(arr::AbstractArray)::Bool
	init = randInit();
	return mapreduce(x->2x, +, arr; init = init) == maptreduce(x->2x, +, arr; init = init);
end

function testMaptreduce1()::Bool
	return templateTestMaptreduce1(randArray());
end

function testMaptreduce1Offset()::Bool
	return templateTestMaptreduce1(offsetArray());
end

function testMaptreduce1Empty()::Bool
	return templateTestMaptreduce1([]);
end

#####

function templateTestMaptreduce1Multiple(arr1::AbstractArray, arr2::AbstractArray)::Bool
	init = randInit();
	return mapreduce((x, y)->2x + 3y, +, arr1, arr2; init = init) == maptreduce((x, y)->2x + 3y, +, arr1, arr2; init = init);
end

function testMaptreduce1Multiple()::Bool
	return templateTestMaptreduce1Multiple(rand2Arrays()...);
end

function testMaptreduce1MultipleOffset()::Bool
	return templateTestMaptreduce1Multiple(offsetArray(), offsetArray());
end

function testMaptreduce1MultipleEmpty()::Bool
	return templateTestMaptreduce1Multiple([], []);
end

#####

function templateTestMaptreduce2(arr::AbstractArray)::Bool
	return mapreduce(x->2x, +, arr) == maptreduce(x->2x, +, arr);
end

function testMaptreduce2()::Bool
	return templateTestMaptreduce2(randArray());
end

function testMaptreduce2Offset()::Bool
	return templateTestMaptreduce2(offsetArray());
end

function testMaptreduce2Empty()
	maptreduce(x->2x, +, []);
end

#####

function templateTestMaptreduce2Multiple(arr1::AbstractArray, arr2::AbstractArray)::Bool
	return mapreduce((x, y)->2x + 3y, +, arr1, arr2) == maptreduce((x, y)->2x + 3y, +, arr1, arr2);
end

function testMaptreduce2Multiple()::Bool
	return templateTestMaptreduce2Multiple(rand2Arrays()...);
end

function testMaptreduce2MultipleOffset()::Bool
	return templateTestMaptreduce2Multiple(offsetArray(), offsetArray());
end

function testMaptreduce2MultipleEmpty()
	maptreduce((x, y)->2x + 3y, +, [], []);
end

#####

function templateTestTmaptreduce1(arr::AbstractArray)::Bool
	init = randInit();
	return mapreduce(x->2x, +, arr; init = init) == tmaptreduce(x->2x, +, arr; init = init);
end

function testTmaptreduce1()::Bool
	return templateTestTmaptreduce1(randArray());
end

function testTmaptreduce1Offset()::Bool
	return templateTestTmaptreduce1(offsetArray());
end

function testTmaptreduce1Empty()::Bool
	return templateTestTmaptreduce1([]);
end

###

function templateTestTmaptreduce1Multiple(arr1::AbstractArray, arr2::AbstractArray)::Bool
	init = randInit();
	return mapreduce((x, y)->2x + 3y, +, arr1, arr2; init = init) == tmaptreduce((x, y)->2x + 3y, +, arr1, arr2; init = init);
end

function testTmaptreduce1Multiple()::Bool
	return templateTestTmaptreduce1Multiple(rand2Arrays()...);
end

function testTmaptreduce1MultipleOffset()::Bool
	return templateTestTmaptreduce1Multiple(offsetArray(), offsetArray());
end

function testTmaptreduce1MultipleEmpty()::Bool
	return templateTestTmaptreduce1Multiple([], []);
end

#####

function templateTestTmaptreduce2(arr::AbstractArray)::Bool
	return mapreduce(x->2x, +, arr) == tmaptreduce(x->2x, +, arr);
end

function testTmaptreduce2()::Bool
	return templateTestTmaptreduce2(randArray());
end

function testTmaptreduce2Offset()::Bool
	return templateTestTmaptreduce2(offsetArray());
end

function testTmaptreduce2Empty()
	tmaptreduce(x->2x, +, []);
end

###

function templateTestTmaptreduce2Multiple(arr1::AbstractArray, arr2::AbstractArray)::Bool
	return mapreduce((x, y)->2x + 3y, +, arr1, arr2) == tmaptreduce((x, y)->2x + 3y, +, arr1, arr2);
end

function testTmaptreduce2Multiple()::Bool
	return templateTestTmaptreduce2Multiple(rand2Arrays()...);
end

function testTmaptreduce2MultipleOffset()::Bool
	return templateTestTmaptreduce2Multiple(offsetArray(), offsetArray());
end

function testTmaptreduce2MultipleEmpty()
	tmaptreduce((x, y)->2x + 3y, +, [], []);
end
