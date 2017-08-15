-- **********************************************************************
-- Lua-Modul: my_clock_functions.lua
-- =================================
--         Uwe Berger; 2016
--
-- Interface:
-- ----------
--     unix2datetime()
--     clock_face_point()
-- ...entspr. Parameter siehe weiteren Quelltext...
--
--
-- ---------
-- Have fun!
--
-- **********************************************************************

local M = {}

M.icon_dx = 32
M.icon_dy = 32

M.icon = {
   {
   0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
   0xff, 0xf5, 0xff, 0xff, 0x7f, 0x80, 0xff, 0xff, 0x3f, 0x80, 0xff, 0xff,
   0x3f, 0x00, 0xc3, 0xff, 0x1f, 0x00, 0x80, 0xff, 0x0f, 0x00, 0x00, 0xff,
   0x07, 0x00, 0x00, 0xf2, 0x03, 0x00, 0x00, 0xe0, 0x03, 0x00, 0x00, 0xc0,
   0x03, 0x00, 0x00, 0xc0, 0x03, 0x00, 0x00, 0xc0, 0x07, 0x00, 0x00, 0xc0,
   0x1f, 0x00, 0x00, 0xe0, 0xff, 0x00, 0xff, 0xff, 0xef, 0xd7, 0xee, 0xf7,
   0xcf, 0x07, 0xee, 0xf3, 0xe7, 0x06, 0xc7, 0xf3, 0xe7, 0x84, 0xe7, 0xf3,
   0x7f, 0x84, 0x7e, 0xff, 0x7f, 0x06, 0x7c, 0xff, 0xbf, 0x07, 0x3f, 0xfe,
   0x9f, 0x1f, 0x37, 0xff, 0x8f, 0x9f, 0x33, 0xff, 0xdf, 0xcf, 0xf3, 0xff,
   0xff, 0xef, 0xf3, 0xff, 0xff, 0xff, 0xfb, 0xff, 0xff, 0xff, 0xff, 0xff,
   0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff
   }
}

return M
