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

sha = try
	readchomp(`git rev-parse --short HEAD`)
catch
	"(not-git-repo)"
end

mktempdir() do temp
	# TODO: key
	git_push(Documenter.Utilities.currentdir(), temp, "github.com/marekdedic/ThreadedMap.jl.git"; target = "build", tag = get(ENV, "CIRCLE_TAG", ""), sha = sha, versions = ["stable" => "v^", "v#.#", "dev" => "dev"]);
end
