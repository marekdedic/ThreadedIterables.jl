export @threaded;

macro threaded(expr::Expr)
	local dict = Dict{Symbol, Symbol}(
		:foreach => :tforeach,
		:mapfoldl => :tmapfoldl,
		:mapfoldr => :tmapfoldr,
		:map => :tmap,
		:map! => :tmap!,
		:mapreduce => :tmaptreduce,
		:reduce => :treduce
	);

	local function replace_threaded(expr::Expr)
		if expr.head == :call
			try
				expr.args[1] = dict[expr.args[1]];
			catch
			end
		end
		for arg in expr.args
			if typeof(arg) == Expr
				replace_threaded(arg);
			end
		end
		return expr;
	end

	return quote
		$(esc(replace_threaded(expr)))
	end
end
