using ThreadedMap;
using Test;

using Random;

include("testForeach.jl");
include("testMap.jl");
include("testReduce.jl");
include("testMapreduce.jl");
include("testMapfoldl.jl");
include("testMapfoldr.jl");

@testset "ThreadedMap.jl" begin
	@testset "foreach" begin
		@testset "tforeach(f, c)" begin
			for i in 1:10000
				@test testTforeach();
			end
		end
		@testset "tforeach(f, c1, c2)" begin
			for i in 1:10000
				@test testTforeachMultiple();
			end
		end
	end
	@testset "map" begin
		@testset "tmap(f, c)" begin
			@testset "Type stable" begin
				for i in 1:10000
					@test testTmapStable();
				end
			end
			@testset "Type unstable" begin
				for i in 1:10000
					@test testTmapUnstable();
				end
			end
		end
		@testset "tmap(f, c1, c2)" begin
			@testset "Type stable" begin
				for i in 1:10000
					@test testTmapStableMultiple();
				end
			end
			@testset "Type unstable" begin
				for i in 1:10000
					@test testTmapUnstableMultiple();
				end
			end
		end
		@testset "tmap!(f, destination, collection)" begin
			for i in 1:10000
				@test testTmap!();
			end
		end
		@testset "tmap!(f, destination, collection1, collection2)" begin
			for i in 1:10000
				@test testTmap!Multiple();
			end
		end
	end
	@testset "reduce" begin
		@testset "reduce(op, v0, itr)" begin
			for i in 1:10000
				@test testTreduce1();
			end
		end
		@testset "reduce(op, itr)" begin
			for i in 1:10000
				@test testTreduce2();
			end
		end
	end
	@testset "mapreduce" begin
		@testset "tmapreduce(f, op, v0, itr)" begin
			@testset "Type stable" begin
				for i in 1:10000
					@test testTmapreduce1Stable();
				end
			end
			@testset "Type unstable" begin
				for i in 1:10000
					@test testTmapreduce1Unstable();
				end
			end
		end
		@testset "tmapreduce(f, op, itr)" begin
			@testset "Type stable" begin
				for i in 1:10000
					@test testTmapreduce2Stable();
				end
			end
			@testset "Type unstable" begin
				for i in 1:10000
					@test testTmapreduce2Unstable();
				end
			end
		end
		@testset "maptreduce(f, op, v0, itr)" begin
			for i in 1:10000
				@test testMaptreduce1();
			end
		end
		@testset "maptreduce(f, op, itr)" begin
			for i in 1:10000
				@test testMaptreduce2();
			end
		end
		@testset "tmaptreduce(f, op, v0, itr)" begin
			for i in 1:10000
				@test testTmaptreduce1();
			end
		end
		@testset "tmatpreduce(f, op, itr)" begin
			for i in 1:10000
				@test testTmaptreduce2();
			end
		end
	end
	@testset "mapfoldl" begin
		@testset "tmapfoldl(f, op, v0, itr)" begin
			@testset "Type stable" begin
				for i in 1:10000
					@test testTmapfoldl1Stable();
				end
			end
			@testset "Type unstable" begin
				for i in 1:10000
					@test testTmapfoldl1Unstable();
				end
			end
		end
		@testset "tmapfoldl(f, op, itr)" begin
			@testset "Type stable" begin
				for i in 1:10000
					@test testTmapfoldl2Stable();
				end
			end
			@testset "Type unstable" begin
				for i in 1:10000
					@test testTmapfoldl2Unstable();
				end
			end
		end
		@testset "tmapfoldr(f, op, v0, itr)" begin
			@testset "Type stable" begin
				for i in 1:10000
					@test testTmapfoldr1Stable();
				end
			end
			@testset "Type unstable" begin
				for i in 1:10000
					@test testTmapfoldr1Unstable();
				end
			end
		end
		@testset "tmapfoldr(f, op, itr)" begin
			@testset "Type stable" begin
				for i in 1:10000
					@test testTmapfoldr2Stable();
				end
			end
			@testset "Type unstable" begin
				for i in 1:10000
					@test testTmapfoldr2Unstable();
				end
			end
		end
	end
end
