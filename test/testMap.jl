function testTmapStable()::Bool
	arr = rand(1:1000, rand(1:10, rand(1:4))...);
	return minimum(map(x->2x, arr) .== tmap(x->2x, arr));
end

function testTmapUnstable()::Bool
	arr = rand(1:1000, rand(1:10, rand(1:4))...);
	str = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin suscipit eleifend faucibus. Aenean in tellus vel urna consectetur vestibulum. Cras pharetra malesuada arcu at dignissim. Duis finibus in est eget accumsan. Quisque interdum urna at dolor sodales, sagittis condimentum nisi egestas. Nullam quis blandit velit, eget consectetur augue. Praesent ut aliquam erat. Integer vitae elementum erat. Curabitur facilisis pharetra libero, non iaculis diam aliquet at. Proin scelerisque ornare dui in sollicitudin. Aenean iaculis risus ut massa ullamcorper, non sodales purus congue. Nullam vitae rhoncus augue, sed maximus ante. Donec id lectus ac lectus tincidunt placerat. Nullam maximus in elit et imperdiet. Vivamus nunc ex, semper at ornare eget, tempor a libero. Proin ut nisi viverra, fringilla ligula eu, iaculis eros. Ut eget ipsum vitae ante ornare gravida. In mollis ligula non odio posuere placerat sed vel metus. Duis ultrices ipsum eu lacus vestibulum lobortis. Nunc vestibulum magna convallis porta pretium. Nunc placerat, sem vel imperdiet bibendum, ex elit tristique dui, non volutpat.";
	return minimum(map(x->str[1:x], arr) .== tmap(x->str[1:x], arr));
end

function testTmapStableMultiple()::Bool
	dims = rand(1:10, rand(1:4));
	arr1 = rand(1:1000, dims...);
	arr2 = rand(1:1000, dims...);
	return minimum(map((x, y)->2x + 3y, arr1, arr2) .== tmap((x, y)->2x + 3y, arr1, arr2));
end

function testTmapUnstableMultiple()::Bool
	dims = rand(1:10, rand(1:4));
	arr1 = rand(1:500, dims...);
	arr2 = rand(1:500, dims...);
	str = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin suscipit eleifend faucibus. Aenean in tellus vel urna consectetur vestibulum. Cras pharetra malesuada arcu at dignissim. Duis finibus in est eget accumsan. Quisque interdum urna at dolor sodales, sagittis condimentum nisi egestas. Nullam quis blandit velit, eget consectetur augue. Praesent ut aliquam erat. Integer vitae elementum erat. Curabitur facilisis pharetra libero, non iaculis diam aliquet at. Proin scelerisque ornare dui in sollicitudin. Aenean iaculis risus ut massa ullamcorper, non sodales purus congue. Nullam vitae rhoncus augue, sed maximus ante. Donec id lectus ac lectus tincidunt placerat. Nullam maximus in elit et imperdiet. Vivamus nunc ex, semper at ornare eget, tempor a libero. Proin ut nisi viverra, fringilla ligula eu, iaculis eros. Ut eget ipsum vitae ante ornare gravida. In mollis ligula non odio posuere placerat sed vel metus. Duis ultrices ipsum eu lacus vestibulum lobortis. Nunc vestibulum magna convallis porta pretium. Nunc placerat, sem vel imperdiet bibendum, ex elit tristique dui, non volutpat.";
	return minimum(map((x, y)->str[1:x + y], arr1, arr2) .== tmap((x, y)->str[1:x + y], arr1, arr2));
end

function testTmap!()::Bool
	n = rand(1:2);
	srcDim = rand(1:3, n);
	destDim = srcDim[randperm(n)];
	srcArr = rand(1:1000, srcDim...);
	destArr = rand(1:1000, destDim...);
	tSrcArr = deepcopy(srcArr);
	tDestArr = deepcopy(destArr);
	map!(x->2x, destArr, srcArr);
	tmap!(x->2x, tDestArr, tSrcArr);
	return minimum(destArr .== tDestArr);
end

function testTmap!Multiple()::Bool
	n = rand(1:2);
	srcDim = rand(1:3, n);
	destDim = srcDim[randperm(n)];
	srcArr1 = rand(1:1000, srcDim...);
	srcArr2 = rand(1:1000, srcDim...);
	destArr = rand(1:1000, destDim...);
	tSrcArr1 = deepcopy(srcArr1);
	tSrcArr2 = deepcopy(srcArr2);
	tDestArr = deepcopy(destArr);
	map!((x, y)->2x + 3y, destArr, srcArr1, srcArr2);
	tmap!((x, y)->2x + 3y, tDestArr, tSrcArr1, tSrcArr2);
	return minimum(destArr .== tDestArr);
end
