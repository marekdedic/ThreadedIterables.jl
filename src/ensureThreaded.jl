function ensureThreaded()
	if Threads.nthreads() == 1
		warn("ThreadedMap.jl used in a single-threaded julia runtime. Please make sure you have set the \"JULIA_NUM_THREADS\" environment variable.");
	end
end
