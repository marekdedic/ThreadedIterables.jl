using ThreadedMap;
using Test;

using Random;

include("utils.jl");

include("testForeach.jl");
include("testMap.jl");
include("testReduce.jl");
include("testMapreduce.jl");
include("testMapfoldl.jl");
include("testMapfoldr.jl");

include("testThreaded.jl");

@testset "ThreadedMap.jl" begin
	@testset "foreach" begin
		@testset "tforeach(f, c)" begin
			for i in 1:1000
				@test testTforeach();
			end
		end
		@testset "tforeach(f, c::OffsetArray)" begin
			@test testTforeachOffset();
		end
		@testset "tforeach(f, [])" begin
			@test testTforeachEmpty();
		end
		@testset "tforeach(f, c1, c2)" begin
			for i in 1:1000
				@test testTforeachMultiple();
			end
		end
		@testset "tforeach(f, c1::OffsetArray, c2::OffsetArray)" begin
			@test testTforeachMultipleOffset();
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
		@testset "tmap(f, c::OffsetArray)" begin
			@test testTmapOffset();
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
		@testset "tmap(f, c1::OffsetArray, c2::OffsetArray)" begin
			@test testTmapMultipleOffset();
		end
		@testset "tmap(f, [], [])" begin
			@test testTmapMultipleEmpty();
		end
		@testset "tmap!(f, destination, collection)" begin
			for i in 1:1000
				@test testTmap!();
			end
		end
		@testset "tmap!(f, destination, collection::OffsetArray)" begin
			@test testTmap!Offset();
		end
		@testset "tmap!(f, destination, [])" begin
			@test testTmap!Empty();
		end
		@testset "tmap!(f, destination, collection1, collection2)" begin
			for i in 1:1000
				@test testTmap!Multiple();
			end
		end
		@testset "tmap!(f, destination, collection1::OffsetArray, collection2::OffsetArray)" begin
			@test testTmap!MultipleOffset();
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
		@testset "reduce(op, v0, itr::OffsetArray)" begin
			@test testTreduce1Offset();
		end
		@testset "reduce(op, v0, [])" begin
			@test testTreduce1Empty();
		end
		@testset "reduce(op, itr)" begin
			for i in 1:1000
				@test testTreduce2();
			end
		end
		@testset "reduce(op, itr::OffsetArray)" begin
			@test testTreduce2Offset();
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
		@testset "tmapreduce(f, op, itr::OffsetArray; init)" begin
			@test testTmapreduce1Offset();
		end
		@testset "tmapreduce(f, op, []; init)" begin
			@test testTmapreduce1Empty();
		end
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
		@testset "tmapreduce(f, op, itr::OffsetArray)" begin
			@test testTmapreduce2Offset();
		end
		@testset "tmapreduce(f, op, [])" begin
			@test_throws ArgumentError testTmapreduce2Empty();
		end
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
			@test_throws ArgumentError testTmapreduce2MultipleEmpty();
		end
		@testset "maptreduce(f, op, itr; init)" begin
			for i in 1:1000
				@test testMaptreduce1();
			end
		end
		@testset "maptreduce(f, op, itr::OffsetArray; init)" begin
			@test testMaptreduce1Offset();
		end
		@testset "maptreduce(f, op, []; init)" begin
			@test testMaptreduce1Empty();
		end
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
		@testset "maptreduce(f, op, itr)" begin
			for i in 1:1000
				@test testMaptreduce2();
			end
		end
		@testset "maptreduce(f, op, itr::OffsetArray)" begin
			@test testMaptreduce2Offset();
		end
		@testset "maptreduce(f, op, [])" begin
			@test_throws ArgumentError testMaptreduce2Empty();
		end
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
		@testset "tmaptreduce(f, op, itr; init)" begin
			for i in 1:1000
				@test testTmaptreduce1();
			end
		end
		@testset "tmaptreduce(f, op, itr::OffsetArray; init)" begin
			@test testTmaptreduce1Offset();
		end
		@testset "tmaptreduce(f, op, []; init)" begin
			@test testTmaptreduce1Empty();
		end
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
		@testset "tmatpreduce(f, op, itr)" begin
			for i in 1:1000
				@test testTmaptreduce2();
			end
		end
		@testset "tmatpreduce(f, op, itr::OffsetArray)" begin
			@test testTmaptreduce2Offset();
		end
		@testset "tmatpreduce(f, op, [])" begin
			@test_throws ArgumentError testTmaptreduce2Empty();
		end
		@testset "tmatpreduce(f, op, itr1, itr2)" begin
			for i in 1:1000
				@test testTmaptreduce2Multiple();
			end
		end
		@testset "tmatpreduce(f, op, itr1::OffsetArray, itr2::OffsetArray)" begin
			@test testTmaptreduce2MultipleOffset();
		end
		@testset "tmatpreduce(f, op, [], [])" begin
			@test_throws ArgumentError testTmaptreduce2MultipleEmpty();
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
		@testset "tmapfoldl(f, op, itr::OffsetArray; init)" begin
			@test testTmapfoldl1Offset();
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
		@testset "tmapfoldl(f, op, itr::OffsetArray)" begin
			@test testTmapfoldl2Offset();
		end
		@testset "tmapfoldl(f, op, [])" begin
			@test_throws ArgumentError testTmapfoldl2Empty();
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
		@testset "tmapfoldr(f, op, itr::OffsetArray; init)" begin
			@test testTmapfoldr1Offset();
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
		@testset "tmapfoldr(f, op, itr::OffsetArray)" begin
			@test testTmapfoldr2Offset();
		end
		@testset "tmapfoldr(f, op, [])" begin
			@test_throws ArgumentError testTmapfoldr2Empty();
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
