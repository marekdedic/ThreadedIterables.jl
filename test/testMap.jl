using ThreadedMap;

function testTmap1Stable()::Bool
	arr = rand(1:1000, rand(1:10, rand(1:4))...);
	return minimum(map(x->2x, arr) .== tmap(x->2x, arr));
end

function testTmap1Unstable()::Bool
	arr = rand(1:1000, rand(1:10, rand(1:4))...);
	str = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin suscipit eleifend faucibus. Aenean in tellus vel urna consectetur vestibulum. Cras pharetra malesuada arcu at dignissim. Duis finibus in est eget accumsan. Quisque interdum urna at dolor sodales, sagittis condimentum nisi egestas. Nullam quis blandit velit, eget consectetur augue. Praesent ut aliquam erat. Integer vitae elementum erat. Curabitur facilisis pharetra libero, non iaculis diam aliquet at. Proin scelerisque ornare dui in sollicitudin. Aenean iaculis risus ut massa ullamcorper, non sodales purus congue. Nullam vitae rhoncus augue, sed maximus ante. Donec id lectus ac lectus tincidunt placerat. Nullam maximus in elit et imperdiet. Vivamus nunc ex, semper at ornare eget, tempor a libero. Proin ut nisi viverra, fringilla ligula eu, iaculis eros. Ut eget ipsum vitae ante ornare gravida. In mollis ligula non odio posuere placerat sed vel metus. Duis ultrices ipsum eu lacus vestibulum lobortis. Nunc vestibulum magna convallis porta pretium. Nunc placerat, sem vel imperdiet bibendum, ex elit tristique dui, non volutpat.";
	return minimum(map(x->str[1:x], arr) .== tmap(x->str[1:x], arr));
end

function testTmap2()::Bool
	arr = rand(1:1000, rand(1:10, rand(1:4))...);
	tarr = deepcopy(arr);
	map!(x->2x, arr);
	tmap!(x->2x, tarr);
	return minimum(arr .== tarr);
end

function testTmap3()::Bool
	n = rand(1:2);
	dim1 = rand(1:3, n);
	dim2 = dim1[randperm(n)];
	arr1 = rand(1:1000, dim1...);
	arr2 = rand(1:1000, dim2...);
	tarr1 = deepcopy(arr1);
	tarr2 = deepcopy(arr2);
	map!(x->2x, arr2, arr1);
	tmap!(x->2x, tarr2, tarr1);
	return minimum(arr2 .== tarr2);
end
