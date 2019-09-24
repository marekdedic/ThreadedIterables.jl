function testTmapreduce1Stable()::Bool
	arr = rand(1:1000, rand(1:10, rand(1:4))...);
	init = rand(1:1000);
	return mapreduce(x->2x, +, arr; init = init) == tmapreduce(x->2x, +, arr; init = init);
end

function testTmapreduce1Unstable()::Bool
	arr = rand(1:100, rand(1:5, rand(1:4))...);
	str = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin suscipit eleifend faucibus. Aenean in tellus vel urna consectetur vestibulum. Cras pharetra malesuada arcu at dignissim. Duis finibus in est eget accumsan. Quisque interdum urna at dolor sodales, sagittis condimentum nisi egestas. Nullam quis blandit velit, eget consectetur augue. Praesent ut aliquam erat. Integer vitae elementum erat. Curabitur facilisis pharetra libero, non iaculis diam aliquet at. Proin scelerisque ornare dui in sollicitudin. Aenean iaculis risus ut massa ullamcorper, non sodales purus congue. Nullam vitae rhoncus augue, sed maximus ante. Donec id lectus ac lectus tincidunt placerat. Nullam maximus in elit et imperdiet. Vivamus nunc ex, semper at ornare eget, tempor a libero. Proin ut nisi viverra, fringilla ligula eu, iaculis eros. Ut eget ipsum vitae ante ornare gravida. In mollis ligula non odio posuere placerat sed vel metus. Duis ultrices ipsum eu lacus vestibulum lobortis. Nunc vestibulum magna convallis porta pretium. Nunc placerat, sem vel imperdiet bibendum, ex elit tristique dui, non volutpat.";
	init = randstring(rand(1:1000));
	return mapreduce(x->str[1:x], *, arr; init = init) == tmapreduce(x->str[1:x], *, arr; init = init);
end

function testTmapreduce1StableMultiple()::Bool
	dims = rand(1:10, rand(1:4));
	arr1 = rand(1:1000, dims...);
	arr2 = rand(1:1000, dims...);
	init = rand(1:1000);
	return mapreduce((x, y)->2x + 3y, +, arr1, arr2; init = init) == tmapreduce((x, y)->2x + 3y, +, arr1, arr2; init = init);
end

function testTmapreduce1UnstableMultiple()::Bool
	dims = rand(1:5, rand(1:4));
	arr1 = rand(1:100, dims...);
	arr2 = rand(1:100, dims...);
	str = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin suscipit eleifend faucibus. Aenean in tellus vel urna consectetur vestibulum. Cras pharetra malesuada arcu at dignissim. Duis finibus in est eget accumsan. Quisque interdum urna at dolor sodales, sagittis condimentum nisi egestas. Nullam quis blandit velit, eget consectetur augue. Praesent ut aliquam erat. Integer vitae elementum erat. Curabitur facilisis pharetra libero, non iaculis diam aliquet at. Proin scelerisque ornare dui in sollicitudin. Aenean iaculis risus ut massa ullamcorper, non sodales purus congue. Nullam vitae rhoncus augue, sed maximus ante. Donec id lectus ac lectus tincidunt placerat. Nullam maximus in elit et imperdiet. Vivamus nunc ex, semper at ornare eget, tempor a libero. Proin ut nisi viverra, fringilla ligula eu, iaculis eros. Ut eget ipsum vitae ante ornare gravida. In mollis ligula non odio posuere placerat sed vel metus. Duis ultrices ipsum eu lacus vestibulum lobortis. Nunc vestibulum magna convallis porta pretium. Nunc placerat, sem vel imperdiet bibendum, ex elit tristique dui, non volutpat.";
	init = randstring(rand(1:1000));
	return mapreduce((x, y)->str[1:x + y], *, arr1, arr2; init = init) == tmapreduce((x, y)->str[1:x + y], *, arr1, arr2; init = init);
end

function testTmapreduce2Stable()::Bool
	arr = rand(1:1000, rand(1:10, rand(1:4))...);
	return mapreduce(x->2x, +, arr) == tmapreduce(x->2x, +, arr);
end

function testTmapreduce2Unstable()::Bool
	arr = rand(1:100, rand(1:5, rand(1:4))...);
	str = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin suscipit eleifend faucibus. Aenean in tellus vel urna consectetur vestibulum. Cras pharetra malesuada arcu at dignissim. Duis finibus in est eget accumsan. Quisque interdum urna at dolor sodales, sagittis condimentum nisi egestas. Nullam quis blandit velit, eget consectetur augue. Praesent ut aliquam erat. Integer vitae elementum erat. Curabitur facilisis pharetra libero, non iaculis diam aliquet at. Proin scelerisque ornare dui in sollicitudin. Aenean iaculis risus ut massa ullamcorper, non sodales purus congue. Nullam vitae rhoncus augue, sed maximus ante. Donec id lectus ac lectus tincidunt placerat. Nullam maximus in elit et imperdiet. Vivamus nunc ex, semper at ornare eget, tempor a libero. Proin ut nisi viverra, fringilla ligula eu, iaculis eros. Ut eget ipsum vitae ante ornare gravida. In mollis ligula non odio posuere placerat sed vel metus. Duis ultrices ipsum eu lacus vestibulum lobortis. Nunc vestibulum magna convallis porta pretium. Nunc placerat, sem vel imperdiet bibendum, ex elit tristique dui, non volutpat.";
	return mapreduce(x->str[1:x], *, arr) == tmapreduce(x->str[1:x], *, arr);
end

function testTmapreduce2StableMultiple()::Bool
	dims = rand(1:10, rand(1:4));
	arr1 = rand(1:1000, dims...);
	arr2 = rand(1:1000, dims...);
	return mapreduce((x, y)->2x + 3y, +, arr1, arr2) == tmapreduce((x, y)->2x + 3y, +, arr1, arr2);
end

function testTmapreduce2UnstableMultiple()::Bool
	dims = rand(1:5, rand(1:4));
	arr1 = rand(1:100, dims...);
	arr2 = rand(1:100, dims...);
	str = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin suscipit eleifend faucibus. Aenean in tellus vel urna consectetur vestibulum. Cras pharetra malesuada arcu at dignissim. Duis finibus in est eget accumsan. Quisque interdum urna at dolor sodales, sagittis condimentum nisi egestas. Nullam quis blandit velit, eget consectetur augue. Praesent ut aliquam erat. Integer vitae elementum erat. Curabitur facilisis pharetra libero, non iaculis diam aliquet at. Proin scelerisque ornare dui in sollicitudin. Aenean iaculis risus ut massa ullamcorper, non sodales purus congue. Nullam vitae rhoncus augue, sed maximus ante. Donec id lectus ac lectus tincidunt placerat. Nullam maximus in elit et imperdiet. Vivamus nunc ex, semper at ornare eget, tempor a libero. Proin ut nisi viverra, fringilla ligula eu, iaculis eros. Ut eget ipsum vitae ante ornare gravida. In mollis ligula non odio posuere placerat sed vel metus. Duis ultrices ipsum eu lacus vestibulum lobortis. Nunc vestibulum magna convallis porta pretium. Nunc placerat, sem vel imperdiet bibendum, ex elit tristique dui, non volutpat.";
	return mapreduce((x, y)->str[1:x + y], *, arr1, arr2) == tmapreduce((x, y)->str[1:x + y], *, arr1, arr2);
end

function testMaptreduce1()::Bool
	arr = rand(1:1000, rand(1:10, rand(1:4))...);
	init = rand(1:1000);
	return mapreduce(x->2x, +, arr; init = init) == maptreduce(x->2x, +, arr; init = init);
end

function testMaptreduce1Multiple()::Bool
	dims = rand(1:10, rand(1:4));
	arr1 = rand(1:1000, dims...);
	arr2 = rand(1:1000, dims...);
	init = rand(1:1000);
	return mapreduce((x, y)->2x + 3y, +, arr1, arr2; init = init) == maptreduce((x, y)->2x + 3y, +, arr1, arr2; init = init);
end

function testMaptreduce2()::Bool
	arr = rand(1:1000, rand(1:10, rand(1:4))...);
	return mapreduce(x->2x, +, arr) == maptreduce(x->2x, +, arr);
end

function testMaptreduce2Multiple()::Bool
	dims = rand(1:10, rand(1:4));
	arr1 = rand(1:1000, dims...);
	arr2 = rand(1:1000, dims...);
	return mapreduce((x, y)->2x + 3y, +, arr1, arr2) == maptreduce((x, y)->2x + 3y, +, arr1, arr2);
end

function testTmaptreduce1()::Bool
	arr = rand(1:1000, rand(1:10, rand(1:4))...);
	init = rand(1:1000);
	return mapreduce(x->2x, +, arr; init = init) == tmaptreduce(x->2x, +, arr; init = init);
end

function testTmaptreduce1Multiple()::Bool
	dims = rand(1:10, rand(1:4));
	arr1 = rand(1:1000, dims...);
	arr2 = rand(1:1000, dims...);
	init = rand(1:1000);
	return mapreduce((x, y)->2x + 3y, +, arr1, arr2; init = init) == tmaptreduce((x, y)->2x + 3y, +, arr1, arr2; init = init);
end

function testTmaptreduce2()::Bool
	arr = rand(1:1000, rand(1:10, rand(1:4))...);
	return mapreduce(x->2x, +, arr) == tmaptreduce(x->2x, +, arr);
end

function testTmaptreduce2Multiple()::Bool
	dims = rand(1:10, rand(1:4));
	arr1 = rand(1:1000, dims...);
	arr2 = rand(1:1000, dims...);
	return mapreduce((x, y)->2x + 3y, +, arr1, arr2) == tmaptreduce((x, y)->2x + 3y, +, arr1, arr2);
end
