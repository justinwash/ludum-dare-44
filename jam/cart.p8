pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
-- set global variables --
left,right,up,down,btn1,btn2=0,1,2,3,4,5
black,dark_blue,dark_purple,dark_green,
brown,dark_gray,light_gray,white,red,
orange,yellow,green,blue,indigo,pink,peach=
0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15

-- lifecycle hooks --
#include main.p8
#include menu.p8
#include gameover.p8

-- player --
#include player.p8

-- map --
#include map.p8

-- cart info --
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000005000000000000050000000000000000000000000000000000000000000000000000000000000000000000000000400000000000000
0000000000000000000005000000000000000500000000000000000000000000000000000000000dd10500000000000000000000000000000040000000000000
000000000500050000000550050005000000055000000000000000000000000000000000000000d1111555300000000000000000004000000044000000000000
00000000055555000000005005555500550000500000000000000000000000000000000000000d111105555f02dddddddddd2003444004400004000000000000
0000000005353500000000500535350555500050055000000000000000500000000000000000d111115555550022ddd2222200f4444044440004000000000000
00000000055f555555500550055f5555555505500055000000000000005500000000000000001111555555500022222222220044444444444044000000000000
00000000005555555555550000555555555555000005000000050000000500000005000000081155555550000022222222200004444444444440000000000000
0000000000055555555550000005555555555000000500000005553000050000000555305099855555555500002aaa22aa200000444444444400000000000000
0000000000055555555550000005555555555000005500000005555f005500000005555f55555555555550500022a22aa2200000444444444400000000000000
0000000000055566665550000005556666555000005005555505555500500555550555550a990555555050000022a2a222200000444444444400000000000000
0000000000055000005550000005500000555000000555555555555000055555555555500aa05500550000000022222222200000440000044400000000000000
000000000005500000055000000550000005500000555555555555000055555555555500a0055005500000000222222222200000440000004400000000000000
00000000000500000000500000050000000050000055555555556500055555555555650000000005000000000222222222000000400000000400000000000000
00000000000500000000500000050000000050000005556666650500050555666665005000000000000000000000000000000000400000000400000000000000
00000000000000000000000000000000000000000005050000050500500500000005000500000000000000000000000000000000000000000000000000000000
00000000000000000000005000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000050000000000000000000000500000000000000055000000000000000000000000000000500000000000000000000000000000000000
00000000050005000000055000000000000000000000505000500000000555500000000000000000000000000000050000000000000000000000000000000000
00000000055555000000005000000000000000000000505555505000003555550000000000000000000005000000055000000000000000000000000000000000
000000000535350555000050000000000e2ee000000055555550500000c355550000000000000000003555005500005000000000000000000000000000000000
00000000055f555555500550000000002e22ee000000055555555000000c335000000000000000000f5555055550005000000000000000500000000000000000
0000000000555555555555000000000e22e22e200000005555555000c030cc000000000000000000055555555555055000000000000005000000000000000000
0000000000055555555550000000002ee2ee222e0000005555500000000000000000000000000000005555555555550005000500000005500000000000000000
000000000005555555555000000000e2222222ee000000555550000000000000b0b0b0b0b0bb0bbb000555555555500005555500000000500000000000000000
0000000000055566665550000000002eee222ee20000055555550000030303000000000000000000000555555555500005353505550000500000000000000000
000000000005500000555000000000e222eee22e00000555555500000b333b0000000000000000000005556666555000055f5555555005500000000000000000
0000000000055000000550000000000ee22e22e0000055055555000033b3b3300d00000000000000000550000055500000555555555555000000000000000000
00000000000500000000500000000000ee22ee0000000000500500000033300000d0000d00000000000550000005500000055555555550000000000000000000
000000000005000000005000eeeeeeeeeee22000000000005005500003b3b300000ddddddf000000000500000000500000055555555550000000000000000000
000000000000000000000000000000000000000000000000500000000b030b00000ddddddd000000000500000000500000005555555550000000000000000000
000000000000000000000000000000000000000000000000050000000000000000d000d0d0000000000000000000000000000555555500000000000000000000
00008888888800000000000004000040000000000400004000000000000000000000000000000000000000000000000000000000000000000000000000000000
00088cc00cc880000000000000400400000000000040040000000000000000000000000000000000000000000000000000000000000000000000000000000000
0088ccccc7cc88004000000000444400004000000044440000000000000000000000000000000000000000000000000000000000000000000000000000000000
088ccccccc6cc8800400000000404000040000000040400000000000000000000000000000000000000000000000000000000000000000000000000000000000
08ccccccccc6cc8000444444444f4f0000444444444f4f0000000000000000000000000000000000000000000000000000000000000000000000000000000000
08cccccccccccc8000444444444fff0000444444444fff0000000000000000000000000000000000000000000000000000000000000000000000000000000000
88888888888888880044444444f0e0000044444444f0e00000000000000000000000000000000000000000000000000000000000000000000000000000000000
8899888888889988000f44fff4f00000004f44fff4f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000
889a888888889a880004040004040000004004004040000000000000000000000000000000000000000000000000000000000000000000000000000000000000
66666666666666660040040004004000040004004004000000000000000000000000000000000000000000000000000000000000000000000000000000000000
66666666666666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
05550000000055500d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0555000000005550d0d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000d000600009ddd66660dd00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000006d006600000dd666d666000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00d0066d066d00000d66666d66d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0d0d066d66d0000000666666dd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
09ddd6d666d00000000666d66dd000000d000d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00dd66666d0000000090090666d000000ddddd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00d66666d00d000009009000666d00000d000d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0006666666d0000000000000006600000d000d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000066666ddd000000000000000000000ddddd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000900900d00000000000000000000000d000d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000009000000000000000000000000000d000d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000ddddd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000d000d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000d000d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000dddddddddddddd00ddddd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000dddddddddddddd00d000d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000d000d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000ddddd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000d000d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__gff__
0000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002020000000000000000000000000101020200000000000000000000
0000010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
