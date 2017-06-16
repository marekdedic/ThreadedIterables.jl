using ThreadedMap;

function testTforeach()::Bool
	arr = rand(1:1000, rand(1:10, rand(1:4))...);
	serial = 0;
	parallel = Threads.Atomic{Int}(0);
	foreach(x->serial+=x, arr);
	tforeach(x->Threads.atomic_add!(parallel, x), arr);
	return serial == parallel[];
end
