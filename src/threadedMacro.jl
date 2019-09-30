export @threaded;

macro threaded(expr::Expr)
	local dict = Dict{Symbol, Symbol}(:foreach => :tforeach, :mapfoldl => :tmapfoldl, :mapfoldr => :tmapfoldr, :map => :tmap, :map! => :tmap!, :mapreduce => :tmaptreduce, :reduce => :treduce);

	local function replace!(expr::Expr)
		if expr.head == :call
			try
				expr.args[1] = dict[expr.args[1]];
			catch
			end
		end
		for arg in expr.args
			if typeof(arg) == Expr
				replace!(arg);
			end
		end
	end

	replace!(expr);
	return expr;
end
