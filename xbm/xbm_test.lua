--
--
--
icon = require "weather_icons"

--d = {}

--d = icon.icon[1]

--print(d[1])


------------------------------------------------------------
local tab = {  -- tab[i][j] = xor(i-1, j-1)
  {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, },
  {1, 0, 3, 2, 5, 4, 7, 6, 9, 8, 11, 10, 13, 12, 15, 14, },
  {2, 3, 0, 1, 6, 7, 4, 5, 10, 11, 8, 9, 14, 15, 12, 13, },
  {3, 2, 1, 0, 7, 6, 5, 4, 11, 10, 9, 8, 15, 14, 13, 12, },
  {4, 5, 6, 7, 0, 1, 2, 3, 12, 13, 14, 15, 8, 9, 10, 11, },
  {5, 4, 7, 6, 1, 0, 3, 2, 13, 12, 15, 14, 9, 8, 11, 10, },
  {6, 7, 4, 5, 2, 3, 0, 1, 14, 15, 12, 13, 10, 11, 8, 9, },
  {7, 6, 5, 4, 3, 2, 1, 0, 15, 14, 13, 12, 11, 10, 9, 8, },
  {8, 9, 10, 11, 12, 13, 14, 15, 0, 1, 2, 3, 4, 5, 6, 7, },
  {9, 8, 11, 10, 13, 12, 15, 14, 1, 0, 3, 2, 5, 4, 7, 6, },
  {10, 11, 8, 9, 14, 15, 12, 13, 2, 3, 0, 1, 6, 7, 4, 5, },
  {11, 10, 9, 8, 15, 14, 13, 12, 3, 2, 1, 0, 7, 6, 5, 4, },
  {12, 13, 14, 15, 8, 9, 10, 11, 4, 5, 6, 7, 0, 1, 2, 3, },
  {13, 12, 15, 14, 9, 8, 11, 10, 5, 4, 7, 6, 1, 0, 3, 2, },
  {14, 15, 12, 13, 10, 11, 8, 9, 6, 7, 4, 5, 2, 3, 0, 1, },
  {15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0, },
}


function bxor (a,b)
  local res, c = 0, 1
  while a > 0 and b > 0 do
    local a2, b2 = (a %16), (b % 16)
    res = res + tab[a2+1][b2+1]*c
    a = (a-a2)/16
    b = (b-b2)/16
    c = c*16
  end
  res = res + a*c + b*c
  return res
end


local ff = 2^32 - 1
function bnot (a) return ff - a end

function band (a,b) return ((a+b) - bxor(a,b))/2 end

function bor (a,b) return ff - band(ff - a, ff - b) end


-- ******************************************************************
function draw(d)
	local idx
	for y=0, icon.icon_dy-1, 1 do
		line=""
		for x=0, icon.icon_dx/8-1, 1 do
			idx = y*icon.icon_dx/8 + x + 1
			--print(idx.." -> "..d[idx])
			if d[idx] == 255 then
				line = line.."        "
			else
				if band(d[idx], 1)   == 0   then line=line.."*" else line=line.." " end
				if band(d[idx], 2)   == 0   then line=line.."*" else line=line.." " end
				if band(d[idx], 4)   == 0   then line=line.."*" else line=line.." " end
				if band(d[idx], 8)   == 0   then line=line.."*" else line=line.." " end
				if band(d[idx], 16)  == 0   then line=line.."*" else line=line.." " end
				if band(d[idx], 32)  == 0   then line=line.."*" else line=line.." " end
				if band(d[idx], 64)  == 0   then line=line.."*" else line=line.." " end
				if band(d[idx], 128) == 0   then line=line.."*" else line=line.." " end
			end
		end
		print(line)
	end
end


draw(icon.icon[1])

