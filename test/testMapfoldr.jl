function testTmapfoldr1Stable()::Bool
	arr = randArray();
	init = randInit();
	return mapfoldr(x->2x, +, arr; init = init) == tmapfoldr(x->2x, +, arr; init = init);
end

function testTmapfoldr1Unstable()::Bool
	arr = randStrArray();
	str = lipsum();
	init = randstring(rand(1:1000));
	return mapfoldr(x->str[1:x], *, arr; init = init) == tmapfoldr(x->str[1:x], *, arr; init = init);
end

function testTmapfoldr2Stable()::Bool
	arr = randArray();
	return mapfoldr(x->2x, +, arr) == tmapfoldr(x->2x, +, arr);
end

function testTmapfoldr2Unstable()::Bool
	arr = randStrArray();
	str = lipsum();
	return mapfoldr(x->str[1:x], *, arr) == tmapfoldr(x->str[1:x], *, arr);
end
