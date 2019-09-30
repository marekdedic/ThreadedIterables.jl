function compareGeneratedCode(groundTruth::String, value::Expr)
	string(Meta.parse(groundTruth)) == string(value);
end

function testThreadedForeach()::Bool
	return compareGeneratedCode("Threaded.tforeach(Threaded.identity, [])", @macroexpand @threaded foreach(identity, []));
end

function testThreadedMapfoldl()::Bool
	return compareGeneratedCode("Threaded.tmapfoldl(Threaded.identity, [])", @macroexpand @threaded mapfoldl(identity, []));
end

function testThreadedMapfoldr()::Bool
	return compareGeneratedCode("Threaded.tmapfoldr(Threaded.identity, [])", @macroexpand @threaded mapfoldr(identity, []));
end

function testThreadedMap()::Bool
	return compareGeneratedCode("Threaded.tmap(Threaded.identity, [])", @macroexpand @threaded map(identity, []));
end

function testThreadedMap!()::Bool
	return compareGeneratedCode("Threaded.tmap!(Threaded.identity, [])", @macroexpand @threaded map!(identity, []));
end

function testThreadedMapreduce()::Bool
	return compareGeneratedCode("Threaded.tmaptreduce(Threaded.identity, [])", @macroexpand @threaded mapreduce(identity, []));
end

function testThreadedReduce()::Bool
	return compareGeneratedCode("Threaded.treduce(Threaded.identity, [])", @macroexpand @threaded reduce(identity, []));
end

# Test that the macro doesn't mess up other functions
function testThreadedOther()::Bool
	return compareGeneratedCode("Threaded.eltype(Threaded.identity, [])", @macroexpand @threaded eltype(identity, []));
end

function testThreadedNested()::Bool
	return compareGeneratedCode("Threaded.tmap(Threaded.tmap!(Threaded.identity), [[]])", @macroexpand @threaded map(map!(identity), [[]]));
end
