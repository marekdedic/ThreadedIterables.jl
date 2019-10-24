using Documenter, Threaded;

makedocs(
	format = Documenter.HTML(),
	sitename = "ThreadedIterables.jl",
	modules = [Threaded],
	authors = "Marek Dědič",
	pages = Any[
		"Home" => "index.md",
		"Reference" => Any[
			"foreach.md",
			"map.md",
			"reduce.md",
			"mapreduce.md",
			"mapfoldl.md",
			"mapfoldr.md"
		]
	]
);
