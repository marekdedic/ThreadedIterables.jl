using Documenter;

if get(ENV, "CIRCLECI", "") == "true"
	sha = try
		readchomp(`git rev-parse --short HEAD`)
	catch
		"(not-git-repo)"
	end

	mktempdir() do temp
		Documenter.git_push(Documenter.Utilities.currentdir(), temp, "github.com/marekdedic/ThreadedMap.jl.git"; target = "docs/build", tag = get(ENV, "CIRCLE_TAG", ""), sha = sha, versions = ["stable" => "v^", "v#.#", "dev" => "dev"]);
	end
end
