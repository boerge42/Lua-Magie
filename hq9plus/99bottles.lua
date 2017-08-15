--
-- 99bottles in Lua
-- ================
-- Uwe Berger, 2107
--
-- ---------
-- Have fun!
--


-- ueber alle Biere...
for beer=99, 1, -1 do
	-- Biere vor dem Trinken
	if beer > 1 then 
		before = beer.." bottles of beer"
	else 
		before = beer.." bottle of beer"
	end
	-- Biere nach dem Trinken
	if (beer-1) > 1 then
		after = (beer-1).." bottles of beer"
	elseif (beer-1) == 1 then
		after = (beer-1).." bottle of beer"
	else
		after = "no more bottles of beer"
	end
	-- Strophe Ausgabe
	print(before.." on the wall, "..before..".")
	print("you take one down and pass it around, "..after.." on the wall.")
	print()
end
-- ...und das Ende
print("No more bottles of beer on the wall, no more bottles of beer.")
print("Go to the store and buy some more, 99 bottles of beer on the wall.")
print()
