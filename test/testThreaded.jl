function compareGeneratedCode(groundTruth::String, value::Expr)
	string(Meta.parse(groundTruth)) == string(value);
end

function testThreadedForeach()::Bool
	return compareGeneratedCode("ThreadedMap.tforeach(ThreadedMap.identity, [])", @macroexpand @threaded foreach(identity, []));
end

function testThreadedMapfoldl()::Bool
	return compareGeneratedCode("ThreadedMap.tmapfoldl(ThreadedMap.identity, [])", @macroexpand @threaded mapfoldl(identity, []));
end

function testThreadedMapfoldr()::Bool
	return compareGeneratedCode("ThreadedMap.tmapfoldr(ThreadedMap.identity, [])", @macroexpand @threaded mapfoldr(identity, []));
end

function testThreadedMap()::Bool
	return compareGeneratedCode("ThreadedMap.tmap(ThreadedMap.identity, [])", @macroexpand @threaded map(identity, []));
end

function testThreadedMap!()::Bool
	return compareGeneratedCode("ThreadedMap.tmap!(ThreadedMap.identity, [])", @macroexpand @threaded map!(identity, []));
end

function testThreadedMapreduce()::Bool
	return compareGeneratedCode("ThreadedMap.tmaptreduce(ThreadedMap.identity, [])", @macroexpand @threaded mapreduce(identity, []));
end

function testThreadedReduce()::Bool
	return compareGeneratedCode("ThreadedMap.treduce(ThreadedMap.identity, [])", @macroexpand @threaded reduce(identity, []));
end

# Test that the macro doesn't mess up other functions
function testThreadedOther()::Bool
	return compareGeneratedCode("ThreadedMap.eltype(ThreadedMap.identity, [])", @macroexpand @threaded eltype(identity, []));
end

function testThreadedNested()::Bool
	return compareGeneratedCode("ThreadedMap.tmap(ThreadedMap.tmap!(ThreadedMap.identity), [[]])", @macroexpand @threaded map(map!(identity), [[]]));
end
