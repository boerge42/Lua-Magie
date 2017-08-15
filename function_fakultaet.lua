function Fakultaet(x)
	if x==1 then return x end
	return x * Fakultaet(x-1)
end

for i=1, 1000 do
	print(Fakultaet(20))
end
