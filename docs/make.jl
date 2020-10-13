using Documenter, ThreadedIterables;

makedocs(
	format = Documenter.HTML(),
	sitename = "ThreadedIterables.jl",
	modules = [ThreadedIterables],
	authors = "Marek Dědič",
	pages = Any[
		"Home" => "index.md",
		"Getting started" => "getting_started.md",
		"Reference" => Any[
			"reference/foreach.md",
			"reference/map.md",
			"reference/reduce.md",
			"reference/mapreduce.md",
			"reference/mapfoldl.md",
			"reference/mapfoldr.md"
		]
	]
);
