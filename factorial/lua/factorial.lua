f = 20
c = 100000
------------------------------
function fact(n) 
	if n <= 1 then
		return n
	else
		return (n * fact(n-1))
	end
end
------------------------------
print (fact(f))

ts_begin = os.clock()
for i = 1, c, 1 do
	fact(f)
end
ts_end = os.clock()
print(c.." x "..f.."!")
print((ts_end - ts_begin).."s")
