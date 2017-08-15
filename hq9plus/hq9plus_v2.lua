--
-- HQ9+ - Interpreter in Lua
-- =========================
--     Uwe Berger, 2107
--
-- Aufruf:
-- -------
-- lua hq9plus_v2.lua <hq9+> [<hq9+>] [...]
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
-- Leerzeichen als Kommando erlaubt.
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
token["q"] = function() print(args) end
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

-- Leerzeichen (keine Funktion)
token[" "] = function() end

-- *****************************************
-- *****************************************
-- *****************************************

--alle Aufrufparameter sind ein hq9+ - Programm
args=""
for i=1, #arg do 
	args=args..arg[i] 
	if i < #arg then args=args.." " end
end


-- Syntax ueberpruefen
for s in string.gmatch(args, ".") do
	if token[s] == nil then
		print(s.." --> Syntax!")
		os.exit()
	end
end


-- Kommando(s) ausfuehren
for s in string.gmatch(args, ".") do
	token[s]()
end
