function testTmapfoldl1Stable()::Bool
	arr = randArray();
	init = randInit();
	return mapfoldl(x->2x, +, arr; init = init) == tmapfoldl(x->2x, +, arr; init = init);
end

function testTmapfoldl1Unstable()::Bool
	arr = randStrArray();
	str = lipsum();
	init = randstring(rand(1:1000));
	return mapfoldl(x->str[1:x], *, arr, init = init) == tmapfoldl(x->str[1:x], *, arr; init = init);
end

function testTmapfoldl2Stable()::Bool
	arr = rand(1:1000, rand(1:10, rand(1:4))...);
	return mapfoldl(x->2x, +, arr) == tmapfoldl(x->2x, +, arr);
end

function testTmapfoldl2Unstable()::Bool
	arr = randStrArray();
	str = lipsum();
	return mapfoldl(x->str[1:x], *, arr) == tmapfoldl(x->str[1:x], *, arr);
end
