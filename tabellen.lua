b = {k1='Wert1', k2='Wert2', k3='Wert3'}
for key, val in pairs(b) do
	print(key, val)
end

b.k4 = 'Wert4'
for key, val in pairs(b) do
	print(key, val)
end



