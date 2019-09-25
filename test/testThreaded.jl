function compareGeneratedCode(groundTruth::String, value::Expr)
	string(Meta.parse(groundTruth)) == string(value);
end

function testThreaded()::Bool
	return compareGeneratedCode("ThreadedMap.tmap(ThreadedMap.identity, [])", @macroexpand @threaded map(identity, []));
end

function testThreadedNested()::Bool
	return compareGeneratedCode("ThreadedMap.tmap(ThreadedMap.tmap(ThreadedMap.identity), [[]])", @macroexpand @threaded map(map(identity), [[]]));
end
