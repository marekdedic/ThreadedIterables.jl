using ThreadedIterables;
using Test;

if VERSION >= v"1.2"
	using OffsetArrays;
end

using Random;

include("utils.jl");

include("testForeach.jl");
include("testMap.jl");
include("testReduce.jl");
include("testMapreduce.jl");
include("testMapfoldl.jl");
include("testMapfoldr.jl");

include("testThreaded.jl");

@testset "ThreadedIterables.jl" begin
	@testset "foreach" begin
		@testset "tforeach(f, c)" begin
			for i in 1:1000
				@test testTforeach();
			end
		end
		if VERSION >= v"1.4"
			@testset "tforeach(f, c::OffsetArray)" begin
				@test testTforeachOffset();
			end
		end
		@testset "tforeach(f, [])" begin
			@test testTforeachEmpty();
		end
		@testset "tforeach(f, c1, c2)" begin
			for i in 1:1000
				@test testTforeachMultiple();
			end
		end
		if VERSION >= v"1.2"
			@testset "tforeach(f, c1::OffsetArray, c2::OffsetArray)" begin
				@test testTforeachMultipleOffset();
			end
		end
		@testset "tforeach(f, [], [])" begin
			@test testTforeachMultipleEmpty();
		end
	end
	@testset "map" begin
		@testset "tmap(f, c)" begin
			@testset "Type stable" begin
				for i in 1:1000
					@test testTmapStable();
				end
			end
			@testset "Type unstable" begin
				for i in 1:1000
					@test testTmapUnstable();
				end
			end
		end
		if VERSION >= v"1.2"
			@testset "tmap(f, c::OffsetArray)" begin
				@test testTmapOffset();
			end
		end
		@testset "tmap(f, [])" begin
			@test testTmapEmpty();
		end
		@testset "tmap(f, c1, c2)" begin
			@testset "Type stable" begin
				for i in 1:1000
					@test testTmapStableMultiple();
				end
			end
			@testset "Type unstable" begin
				for i in 1:1000
					@test testTmapUnstableMultiple();
				end
			end
		end
		if VERSION >= v"1.2"
			@testset "tmap(f, c1::OffsetArray, c2::OffsetArray)" begin
				@test testTmapMultipleOffset();
			end
		end
		@testset "tmap(f, [], [])" begin
			@test testTmapMultipleEmpty();
		end
		@testset "tmap!(f, destination, collection)" begin
			for i in 1:1000
				@test testTmap!();
			end
		end
		@testset "tmap!(f, destination, [])" begin
			@test testTmap!Empty();
		end
		@testset "tmap!(f, destination, collection1, collection2)" begin
			for i in 1:1000
				@test testTmap!Multiple();
			end
		end
		@testset "tmap!(f, destination, [], [])" begin
			@test testTmap!MultipleEmpty();
		end
		@testset "tmap(f, c1, c2) where length(c1) != length(c2)" begin
			@test_throws DimensionMismatch testTmapMultipleDimensionMismatch();
		end
	end
	@testset "reduce" begin
		@testset "reduce(op, v0, itr)" begin
			for i in 1:1000
				@test testTreduce1();
			end
		end
		if VERSION >= v"1.2"
			@testset "reduce(op, v0, itr::OffsetArray)" begin
				@test testTreduce1Offset();
			end
		end
		@testset "reduce(op, v0, [])" begin
			@test testTreduce1Empty();
		end
		@testset "reduce(op, itr)" begin
			for i in 1:1000
				@test testTreduce2();
			end
		end
		if VERSION >= v"1.2"
			@testset "reduce(op, itr::OffsetArray)" begin
				@test testTreduce2Offset();
			end
		end
		@testset "reduce(op, [])" begin
			@test_throws ArgumentError testTreduce2Empty();
		end
	end
	@testset "mapreduce" begin
		@testset "tmapreduce(f, op, itr; init)" begin
			@testset "Type stable" begin
				for i in 1:1000
					@test testTmapreduce1Stable();
				end
			end
			@testset "Type unstable" begin
				for i in 1:1000
					@test testTmapreduce1Unstable();
				end
			end
		end
		if VERSION >= v"1.2"
			@testset "tmapreduce(f, op, itr::OffsetArray; init)" begin
				@test testTmapreduce1Offset();
			end
		end
		@testset "tmapreduce(f, op, []; init)" begin
			@test testTmapreduce1Empty();
		end
		if VERSION >= v"1.2"
			@testset "tmapreduce(f, op, itr1, itr2; init)" begin
				@testset "Type stable" begin
					for i in 1:1000
						@test testTmapreduce1StableMultiple();
					end
				end
				@testset "Type unstable" begin
					for i in 1:1000
						@test testTmapreduce1UnstableMultiple();
					end
				end
			end
			@testset "tmapreduce(f, op, itr1::OffsetArray, itr2::OffsetArray; init)" begin
				@test testTmapreduce1MultipleOffset();
			end
			@testset "tmapreduce(f, op, [], []; init)" begin
				@test testTmapreduce1MultipleEmpty();
			end
		end
		@testset "tmapreduce(f, op, itr)" begin
			@testset "Type stable" begin
				for i in 1:1000
					@test testTmapreduce2Stable();
				end
			end
			@testset "Type unstable" begin
				for i in 1:1000
					@test testTmapreduce2Unstable();
				end
			end
		end
		if VERSION >= v"1.2"
			@testset "tmapreduce(f, op, itr::OffsetArray)" begin
				@test testTmapreduce2Offset();
			end
		end
		@testset "tmapreduce(f, op, [])" begin
			@test_throws Union{ArgumentError,MethodError} testTmapreduce2Empty();
		end
		if VERSION >= v"1.2"
			@testset "tmapreduce(f, op, itr1, itr2)" begin
				@testset "Type stable" begin
					for i in 1:1000
						@test testTmapreduce2StableMultiple();
					end
				end
				@testset "Type unstable" begin
					for i in 1:1000
						@test testTmapreduce2UnstableMultiple();
					end
				end
			end
			@testset "tmapreduce(f, op, itr1::OffsetArray, itr2::OffsetArray)" begin
				@test testTmapreduce2MultipleOffset();
			end
			@testset "tmapreduce(f, op, [], [])" begin
				@test_throws Union{ArgumentError,MethodError} testTmapreduce2MultipleEmpty();
			end
		end
		@testset "maptreduce(f, op, itr; init)" begin
			for i in 1:1000
				@test testMaptreduce1();
			end
		end
		if VERSION >= v"1.2"
			@testset "maptreduce(f, op, itr::OffsetArray; init)" begin
				@test testMaptreduce1Offset();
			end
		end
		@testset "maptreduce(f, op, []; init)" begin
			@test testMaptreduce1Empty();
		end
		if VERSION >= v"1.2"
			@testset "maptreduce(f, op, itr1, itr2; init)" begin
				for i in 1:1000
					@test testMaptreduce1Multiple();
				end
			end
			@testset "maptreduce(f, op, itr1::OffsetArray, itr2::OffsetArray; init)" begin
				@test testMaptreduce1MultipleOffset();
			end
			@testset "maptreduce(f, op, [], []; init)" begin
				@test testMaptreduce1MultipleEmpty();
			end
		end
		@testset "maptreduce(f, op, itr)" begin
			for i in 1:1000
				@test testMaptreduce2();
			end
		end
		if VERSION >= v"1.2"
			@testset "maptreduce(f, op, itr::OffsetArray)" begin
				@test testMaptreduce2Offset();
			end
		end
		@testset "maptreduce(f, op, [])" begin
			@test_throws ArgumentError testMaptreduce2Empty();
		end
		if VERSION >= v"1.2"
			@testset "maptreduce(f, op, itr1, itr2)" begin
				for i in 1:1000
					@test testMaptreduce2Multiple();
				end
			end
			@testset "maptreduce(f, op, itr1::OffsetArray, itr2::OffsetArray)" begin
				@test testMaptreduce2MultipleOffset();
			end
			@testset "maptreduce(f, op, [], [])" begin
				@test_throws ArgumentError testMaptreduce2MultipleEmpty();
			end
		end
		@testset "tmaptreduce(f, op, itr; init)" begin
			for i in 1:1000
				@test testTmaptreduce1();
			end
		end
		if VERSION >= v"1.2"
			@testset "tmaptreduce(f, op, itr::OffsetArray; init)" begin
				@test testTmaptreduce1Offset();
			end
		end
		@testset "tmaptreduce(f, op, []; init)" begin
			@test testTmaptreduce1Empty();
		end
		if VERSION >= v"1.2"
			@testset "tmaptreduce(f, op, itr1, itr2; init)" begin
				for i in 1:1000
					@test testTmaptreduce1Multiple();
				end
			end
			@testset "tmaptreduce(f, op, itr1::OffsetArray, itr2::OffsetArray; init)" begin
				@test testTmaptreduce1MultipleOffset();
			end
			@testset "tmaptreduce(f, op, [], []; init)" begin
				@test testTmaptreduce1MultipleEmpty();
			end
		end
		@testset "tmaptpreduce(f, op, itr)" begin
			for i in 1:1000
				@test testTmaptreduce2();
			end
		end
		if VERSION >= v"1.2"
			@testset "tmatpreduce(f, op, itr::OffsetArray)" begin
				@test testTmaptreduce2Offset();
			end
		end
		@testset "tmaptpreduce(f, op, [])" begin
			@test_throws ArgumentError testTmaptreduce2Empty();
		end
		if VERSION >= v"1.2"
			@testset "tmaptpreduce(f, op, itr1, itr2)" begin
				for i in 1:1000
					@test testTmaptreduce2Multiple();
				end
			end
			@testset "tmatpreduce(f, op, itr1::OffsetArray, itr2::OffsetArray)" begin
				@test testTmaptreduce2MultipleOffset();
			end
			@testset "tmaptpreduce(f, op, [], [])" begin
				@test_throws ArgumentError testTmaptreduce2MultipleEmpty();
			end
		end
	end
	@testset "mapfoldl" begin
		@testset "tmapfoldl(f, op, itr; init)" begin
			@testset "Type stable" begin
				for i in 1:1000
					@test testTmapfoldl1Stable();
				end
			end
			@testset "Type unstable" begin
				for i in 1:1000
					@test testTmapfoldl1Unstable();
				end
			end
		end
		if VERSION >= v"1.2"
			@testset "tmapfoldl(f, op, itr::OffsetArray; init)" begin
				@test testTmapfoldl1Offset();
			end
		end
		@testset "tmapfoldl(f, op, []; init)" begin
			@test testTmapfoldl1Empty();
		end
		@testset "tmapfoldl(f, op, itr)" begin
			@testset "Type stable" begin
				for i in 1:1000
					@test testTmapfoldl2Stable();
				end
			end
			@testset "Type unstable" begin
				for i in 1:1000
					@test testTmapfoldl2Unstable();
				end
			end
		end
		if VERSION >= v"1.2"
			@testset "tmapfoldl(f, op, itr::OffsetArray)" begin
				@test testTmapfoldl2Offset();
			end
		end
		@testset "tmapfoldl(f, op, [])" begin
			@test_throws Union{ArgumentError,MethodError} testTmapfoldl2Empty();
		end
	end
	@testset "mapfoldr" begin
		@testset "tmapfoldr(f, op, itr; init)" begin
			@testset "Type stable" begin
				for i in 1:1000
					@test testTmapfoldr1Stable();
				end
			end
			@testset "Type unstable" begin
				for i in 1:1000
					@test testTmapfoldr1Unstable();
				end
			end
		end
		if VERSION >= v"1.2"
			@testset "tmapfoldr(f, op, itr::OffsetArray; init)" begin
				@test testTmapfoldr1Offset();
			end
		end
		@testset "tmapfoldr(f, op, []; init)" begin
			@test testTmapfoldr1Empty();
		end
		@testset "tmapfoldr(f, op, itr)" begin
			@testset "Type stable" begin
				for i in 1:1000
					@test testTmapfoldr2Stable();
				end
			end
			@testset "Type unstable" begin
				for i in 1:1000
					@test testTmapfoldr2Unstable();
				end
			end
		end
		if VERSION >= v"1.2"
			@testset "tmapfoldr(f, op, itr::OffsetArray)" begin
				@test testTmapfoldr2Offset();
			end
		end
		@testset "tmapfoldr(f, op, [])" begin
			@test_throws Union{ArgumentError,MethodError} testTmapfoldr2Empty();
		end
	end
	@testset "@threaded" begin
		@test testThreadedForeach();
		@test testThreadedMapfoldl();
		@test testThreadedMapfoldr();
		@test testThreadedMap();
		@test testThreadedMap!();
		@test testThreadedMapreduce();
		@test testThreadedReduce();
		@test testThreadedOther();
		@test testThreadedNested();
	end
end
