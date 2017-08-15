Fakultaet = function(x)
	if x==1 then return x end
	return x * Fakultaet(x-1)
end

print(Fakultaet(20))
