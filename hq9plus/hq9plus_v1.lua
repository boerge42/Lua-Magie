--
-- HQ9+ - Interpreter in Lua
-- =========================
--     Uwe Berger, 2107
--
-- Aufruf:
-- -------
-- lua hq9plus_v1.lua <hq9+>
--
-- hq9+ - Syntax:
-- --------------
-- H --> "Hello World!"
-- Q --> Quine
-- 9 --> 99 bottles of beer
-- + --> internen Zaehler um 1 erhoehen ;-)
--
-- Variante:
-- ---------
-- Argumentstring in eine interne Tabelle und mit
-- dieser in der Folge arbeiten...
--
-- ---------
-- Have fun!
--


-- Syntax/Funktionalitaet definieren...
token = {}

-- H
token["h"] = function() print("Hello world!") end
token["H"] = token["h"]

-- Q
token["q"] = function() print(arg[1]) end
token["Q"] = token["q"]

-- 9
token["9"] = function() 
				for beer=99, 1, -1 do
					-- vor dem Trinken
					if beer > 1 then 
						before = beer.." bottles of beer"
					else 
						before = beer.." bottle of beer"
					end
					-- nach dem Trinken
					if (beer-1) > 1 then
						after = (beer-1).." bottles of beer"
					elseif (beer-1) == 1 then
						after = (beer-1).." bottle of beer"
					else
						after = "no more bottles of beer"
					end
					-- Ausgabe
					print(before.." on the wall, "..before..".")
					print("you take one down and pass it around, "..after.." on the wall.")
					print()
				end
				print("No more bottles of beer on the wall, no more bottles of beer.")
				print("Go to the store and buy some more, 99 bottles of beer on the wall.")
				print()
			 end

-- +
token["+"] = function() 
				local accu = 0 
				accu = accu + 1 
			 end

-- ************************
function syntax_ok(t, c) 
	for i=1, #c do
		if t[c[i]] == nil then return false end
	end
	return true
end


-- ************************
-- ************************
-- ************************

--Kommandozeile in eine Tabelle laden
cmd = {}
for s in string.gmatch(arg[1], ".") do
			table.insert(cmd, s)
end



-- Syntax ueberpruefen
if not syntax_ok(token, cmd) then
	print("Syntax!")
	os.exit()
end

-- Kommando(s) ausfuehren (numerischer for)
--for i=1, #cmd do token[cmd[i]]() end 

-- Kommando(s) ausfuehren (generischer for)
for i, c in ipairs(cmd) do token[c]() end
