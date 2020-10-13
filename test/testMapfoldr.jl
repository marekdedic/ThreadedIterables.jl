function templateTestTmapfoldr1(arr::AbstractArray)::Bool
	init = randInit();
	return mapfoldr(x->2x, +, arr; init = init) == tmapfoldr(x->2x, +, arr; init = init);
end

function testTmapfoldr1Stable()::Bool
	return templateTestTmapfoldr1(randArray());
end

function testTmapfoldr1Unstable()::Bool
	arr = randStrArray();
	str = lipsum();
	init = randstring(rand(1:1000));
	return mapfoldr(x->str[1:x], *, arr; init = init) == tmapfoldr(x->str[1:x], *, arr; init = init);
end

function testTmapfoldr1Offset()::Bool
	return templateTestTmapfoldr1(offsetArray());
end

function testTmapfoldr1Empty()::Bool
	return templateTestTmapfoldr1([]);
end

#####

function templateTestTmapfoldr2(arr::AbstractArray)::Bool
	return mapfoldr(x->2x, +, arr) == tmapfoldr(x->2x, +, arr);
end

function testTmapfoldr2Stable()::Bool
	return templateTestTmapfoldr2(randArray());
end

function testTmapfoldr2Unstable()::Bool
	arr = randStrArray();
	str = lipsum();
	return mapfoldr(x->str[1:x], *, arr) == tmapfoldr(x->str[1:x], *, arr);
end

function testTmapfoldr2Offset()::Bool
	return templateTestTmapfoldr2(offsetArray());
end

function testTmapfoldr2Empty()
	tmapfoldr(x->2x, (x, y)->x, []);
end
