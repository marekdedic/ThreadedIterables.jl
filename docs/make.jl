using Documenter, ThreadedMap;

makedocs(
	format = :html,
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

deploydocs(
	repo = "github.com/marekdedic/ThreadedMap.jl.git"
);
