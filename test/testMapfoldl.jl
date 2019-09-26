function templateTestTmapfoldl1(arr::AbstractArray)::Bool
	init = randInit();
	return mapfoldl(x->2x, +, arr; init = init) == tmapfoldl(x->2x, +, arr; init = init);
end

function testTmapfoldl1Stable()::Bool
	return templateTestTmapfoldl1(randArray());
end

function testTmapfoldl1Unstable()::Bool
	arr = randStrArray();
	str = lipsum();
	init = randstring(rand(1:1000));
	return mapfoldl(x->str[1:x], *, arr, init = init) == tmapfoldl(x->str[1:x], *, arr; init = init);
end

function testTmapfoldl1Offset()::Bool
	return templateTestTmapfoldl1(offsetArray());
end

function testTmapfoldl1Empty()::Bool
	return templateTestTmapfoldl1([]);
end

#####

function templateTestTmapfoldl2(arr::AbstractArray)::Bool
	return mapfoldl(x->2x, +, arr) == tmapfoldl(x->2x, +, arr);
end

function testTmapfoldl2Stable()::Bool
	return templateTestTmapfoldl2(randArray());
end

function testTmapfoldl2Unstable()::Bool
	arr = randStrArray();
	str = lipsum();
	return mapfoldl(x->str[1:x], *, arr) == tmapfoldl(x->str[1:x], *, arr);
end

function testTmapfoldl2Offset()::Bool
	return templateTestTmapfoldl2(offsetArray());
end

function testTmapfoldl2Empty()
	tmapfoldl(x->2x, (x, y)->x, []);
end
