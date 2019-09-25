function randArray()::Array{Int}
	arr = rand(1:1000, rand(1:10, rand(1:4))...);
end

function randStrArray()::Array{Int}
	arr = rand(1:100, rand(1:4, rand(1:3))...);
end

function lipsum()::String
	return "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dignissim, lacus et aliquet pellentesque, nibh turpis suscipit justo, non gravida massa lorem eu urna. Curabitur suscipit sapien vitae odio accumsan, quis mollis lectus tincidunt. Vestibulum tincidunt hendrerit nisl ac mattis. Praesent tristique magna quis tortor porta egestas. Morbi orci purus, posuere sit amet magna ac, sagittis pretium ipsum. Nam dictum turpis eu vulputate accumsan. Aliquam scelerisque ante sit amet justo facilisis, varius ornare orci posuere. In eu quam et ex sagittis fermentum et eu mauris. Sed porttitor massa in aliquam bibendum. Nam eleifend sed arcu a lobortis. Pellentesque semper, sapien non auctor consectetur, est nunc sollicitudin dolor, quis imperdiet dui turpis ac dui. Praesent nec vestibulum sem, ut placerat arcu. Quisque rhoncus placerat turpis, nec dictum mauris pulvinar vitae. Sed consectetur sem et ante tempor rutrum id et arcu. Maecenas sit amet finibus enim. Sed maximus mollis mauris in pretium. Suspendisse vehicula dui convallis aliquet mollis. Nunc justo felis, dictum ut efficitur at, hendrerit in est. Vestibulum faucibus quam mi, eget vulputate nisi iaculis ac. Nunc sem purus, convallis quis interdum vel, laoreet non orci. Praesent sed scelerisque mi. Aliquam sit amet lectus eu odio tempus tristique in et augue. Aliquam ornare augue ac tellus bibendum luctus. Morbi et ultricies magna. Pellentesque id libero tortor. Aenean bibendum dui nec bibendum suscipit. Maecenas in odio sodales, condimentum elit sit amet, euismod nisl. Nunc varius nulla sed elit posuere, vel fringilla mauris dictum. Nulla id condimentum lorem, eget efficitur odio. Nunc fermentum eros a sollicitudin laoreet. Maecenas suscipit, ipsum tempor lacinia aliquam, urna dui sagittis nisi, vel semper sapien orci quis nunc. Proin a rhoncus nunc, dapibus viverra dolor. Aliquam erat volutpat. Sed aliquam leo in sem mattis lobortis. Morbi vestibulum lectus nibh, sit amet gravida velit efficitur nec. Nam eget ligula sit amet neque mattis malesuada cras amet.";
end

function rand2Arrays()::Tuple{Array{Int}, Array{Int}}
	dims = rand(1:10, rand(1:4));
	return rand(1:1000, dims...), rand(1:1000, dims...);
end

function rand2StrArrays()::Tuple{Array{Int}, Array{Int}}
	dims = rand(1:4, rand(1:3));
	return rand(1:100, dims...), rand(1:100, dims...);
end

function randInit()::Float32
	return rand(1:1000);
end
