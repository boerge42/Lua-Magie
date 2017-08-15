--
-- wc (wordcount) in Lua
-- =====================
--   Uwe Berger, 2017
--
-- Aufruf:
-- -------
-- lua wc.lua <Textdatei>
--
--
-- ---------
-- Have fun!
--


-- Anzahl Zeichen
function letters(t)
	return #t
end

-- Anzahl Woerter
function words(t)
	local count = 0
	for s in string.gmatch(t, "%s+") do
		count = count +1
	end
	return count
end

-- Anzahl Zeilen
function lines(t)
	local count = 0
	for s in string.gmatch(t, "\n") do
		count = count +1
	end
	return count
end


-- *****************************************
-- *****************************************
-- *****************************************

-- Datei einlesen
local f = assert(io.open(arg[1], "r"))
local text = f:read("*all")
f:close()

-- Ausgabe
print(lines(text), words(text), letters(text), arg[1])
