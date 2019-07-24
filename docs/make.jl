using Documenter, ThreadedMap;

makedocs(
	format = Documenter.HTML(),
	sitename = "ThreadedMap.jl",
	modules = [ThreadedMap],
	authors = "Marek Dědič",
	pages = Any[
		"Home" => "index.md",
		"Reference" => Any[
			"foreach.md",
			"map.md",
			"reduce.md",
			"mapreduce.md",
			"mapfoldl.md",
			"mapfoldr.md"]
		]
);
