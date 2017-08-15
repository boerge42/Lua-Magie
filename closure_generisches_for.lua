function iterator(a)
   local i = 0
   return function()
            i = i + 1
            return a[i]
          end
end

l = {"Fruehling", "Sommer", "Herbst", "Winter"}
for wert in iterator(l) do
	print (wert)
end
