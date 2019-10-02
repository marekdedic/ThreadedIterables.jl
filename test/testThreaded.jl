function compareGeneratedCode(groundTruth::String, value::Expr)
	string(Meta.parse(groundTruth)) == join(filter(s -> !startswith(s, "#="), strip.(split(string(value), "\n")[2:end-1])), "\n");
end

function testThreadedForeach()::Bool
	return compareGeneratedCode("tforeach(identity, [])", @macroexpand @threaded foreach(identity, []));
end

function testThreadedMapfoldl()::Bool
	return compareGeneratedCode("tmapfoldl(identity, [])", @macroexpand @threaded mapfoldl(identity, []));
end

function testThreadedMapfoldr()::Bool
	return compareGeneratedCode("tmapfoldr(identity, [])", @macroexpand @threaded mapfoldr(identity, []));
end

function testThreadedMap()::Bool
	return compareGeneratedCode("tmap(identity, [])", @macroexpand @threaded map(identity, []));
end

function testThreadedMap!()::Bool
	return compareGeneratedCode("tmap!(identity, [])", @macroexpand @threaded map!(identity, []));
end

function testThreadedMapreduce()::Bool
	return compareGeneratedCode("tmaptreduce(identity, [])", @macroexpand @threaded mapreduce(identity, []));
end

function testThreadedReduce()::Bool
	return compareGeneratedCode("treduce(identity, [])", @macroexpand @threaded reduce(identity, []));
end

# Test that the macro doesn't mess up other functions
function testThreadedOther()::Bool
	return compareGeneratedCode("eltype(identity, [])", @macroexpand @threaded eltype(identity, []));
end

function testThreadedNested()::Bool
	return compareGeneratedCode("tmap(tmap!(identity), [[]])", @macroexpand @threaded map(map!(identity), [[]]));
end
