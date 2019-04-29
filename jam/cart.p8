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
#include story.p8
#include menu.p8
#include gameover.p8
#include buy.p8
#include yarnballs.p8
#include pigeons.p8
#include levelclear.p8
#include levelfail.p8
#include win.p8

-- player --
#include player.p8

-- map --
#include map.p8

-- cart info --
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000400000000000000
0000000000000000000000500000000000005000000000000000000000000000000000000000501dd00000000000000000000000000000000040000000000000
000000000000000000000500000000000000050000000000000000000000000000000000035551111d0000000000000000000000004000000044000000000000
000000000500050000000550050005000000055000000000000000000000000000000000f555501111d0000002dddddddddd2003444004400004000000000000
00000000055555000000005005555500550000500000000000000550000000000000050055555511111d00000022ddd2222200f4444044440004000000000000
00000000053535000000005005353505555000500000000000005500000000000000550005555555111100000022222222220044444444444044000000000000
00000000055f555555500550055f5555555505500000500000005000000050000000500000055555551180000022222222200004444444444440000000000000
0000000000555555555555000055555555555500035550000000500003555000000050000055555555589905002aaa22aa200000444444444400000000000000
0000000000055555555550000005555555555000f555500000005500f55550000000550005055555555555550022a22aa2200000444444444400000000000000
00000000000555555555500000055555555550005555505555500500555550555550050000050555555099a00022a2a222200000444444444400000000000000
0000000000055566665550000005556666555000055555555555500005555555555550000000005500550aa00022222222200000440000044400000000000000
000000000005500000555000000550000055500000555555555555000055555555555500000000055005500a0222222222200000440000004400000000000000
00000000000550000005500000055000000550000056555555555500005655555555555000000000500000000222222222000000400000000400000000000000
00000000000500000000500000050000000050000050566666555000050056666655505000000000000000000000000000000000400000000400000000000000
00000000000500000000500000050000000050000050500000505000500050000000500500000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000500000000000000055000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000005000000000000000000000505000500000000555500000000000000000000000000000500000000000000000000000500000000000
00000000000000000000050000000000000000000000505555505000003555550000000000000000000000000000050000000000000000000355500000000000
000000000500050000000550000000000e2ee000000055555550500000c35555000000000000000000000500000005500000000000000000f555500000000000
000000000555550000000050000000002e22ee000000055555555000000c33500000000000000000003555005500005000000000000000505555550000000000
0000000005353505550000500000000e22e22e200000005555555000c030cc0000000000000000000f5555055550005000000000000005000555555500000000
00000000055f5555555005500000002ee2ee222e0000005555500000000000000000000000000000055555555555055005000500000005500005555555000000
000000000055555555555500000000e2222222ee000000555550000000000000b0b0b0b0b0bb0bbb005555555555550005555500000000500055555555500005
0000000000055555555550000000002eee222ee2000005555555000003030300b0b0b0b0b0bb0bbb000555555555500005353505550000500505555555555555
000000000005555555555000000000e222eee22e00000555555500000b333b0000000000000000000005555555555000055f5555555005500005055555500000
0000000000055566665550000000000ee22e22e0000055055555000033b3b3300d00000000000000000555666655500000555555555555000000005500550000
00000000000550000055500000000000ee22ee0000000000500500000033300000d0000d00000000000550000055500000055555555550000000000550055000
000000000005500000055000eeeeeeeeeee22000000000005005500003b3b300000ddddddf000000000550000005500000055555555550000000000050000000
000000000005000000005000000000000000000000000000500000000b030b00000ddddddd000000000500000000500000005555555550000000000000000000
000000000005000000005000000000000000000000000000050000000000000000d000d0d0000000000500000000500000000555555500000000000000000000
0000000000000000000000000000000000000000000000000000000000000000bb000000dddddddd000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000bbbbbb0000d2d22d2d000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000033b3b33bbb00d2d22d2d000000000000000000000000000000000000000000000000
0000888888880000000000000000000000000000000000000000000000333b333b333b00d2d22d2d000000000000000000000000000000000000000000000000
00088cc55cc880000000000000000000000000000000000000000000033b333333b333b0d2d22d2d000000000000000000000000000000000000000000000000
0088ccccc7cc8800000000000000000000000000000000000000000003343343343343b0dddddddd000000000000000000000000000000000000000000000000
088ccccccc6cc880040000400000000004000040000000000000000033334343433343bbdddddddd000000000000000000000000000000000000000000000000
08ccccccccc6cc8000400400000000000040040000000000000000003333b4443334bb3b22222222000000000000000000000000000000000000000000000000
08cccccccccccc8000444400000000040044440000000400000000000333334443433b3b00000000000000000000000000000000000000000000000000000000
88888888888888880014140000000040001414000000004000000000003333344433344300000000000000000000000000000000000000000000000000000000
889988888888998800f4f4444444440000f4f4444444440000000000003344344433433b00000000000000000000000000000000000000000000000000000000
889a888888889a8800fff4444444440000fff44444444400000000000003334444343bb000000000000000000000000000000000000000000000000000000000
6666666666666666000e0f4444444400000e0f444444440000000000000333344443bb0000000000000000000000000000000000000000000000000000000000
666666666666666600000f4fff44f00000000f4fff44f4000000000000000334443b000000000000000000000000000000000000000000000000000000000000
05550000000055500000404000404000000004040040040000000000000000044400000000000000000000000000000000000000000000000000000000000000
05550000000055500004004000400400000040040040004000000000000000044400000000000000000000000000000000000000000000000000000000000000
000000d0006000000d000000000000000d0000d000000c000000c000000000044400000000000000000000000000000000000000000000000000000000000000
000006d006600000d1d00000000000000d0000d0c000000000000000000000044400000000000000000000000000000000000000000000000000000000000000
0d0066d066d000009ddd66660dd000000dddddd0000cc00c00cc00c0000000044400000000000000000000000000000000000000000000000000000000000000
d1d066d66d0000000dd666d6660000000d0000d000c01c000c10c000000000044400000000000000000000000000000000000000000000000000000000000000
9ddd6d666d0000000d66666d66d000000d0000d00c1001c0c1001c00000000044400000000000000000000000000000000000000000000000000000000000000
0dd66666d000000000666666dd0000000dddddd0c10cc0c1c0cc01c0000000044400000000000000000000000000000000000000000000000000000000000000
0d66666d00d00000000666d66dd000000d0000d0c1c11cc1cc11c1c0000000044400000000000000000000000000000000000000000000000000000000000000
006666666d0000000090090666d000000d0000d0c1c001c1c101c1c0000000044400000000000000000000000000000000000000000000000000000000000000
00066666ddd0000009009000666d00000dddddd0c1c00cc1cc01c1c0000000044400000000000000000000000000000000000000000000000000000000000000
00900900d000000000000000006600000d0000d0c1c0c0c1c1c1c1c0000000044400000000000000000000000000000000000000000000000000000000000000
000090000000000000000000000000000d0000d0c1c0c0c1c0c1c1c0000000044400000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000dddddd0c1c0c0c1c0c1c1c0000000044400000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000d0000d0c1c0c0c1c0c1c1c0000000044400000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000d0000d00c1c00c1c0cc1c00000000044400000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000dddddd0c01c00c1c00c100c000000044400000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000d0000d0000000c1c0000000000000044400000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00aaa000000aaa000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0afffa0000afffa00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0acfca0000acfca00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
a0fff0a00a0f8f0a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000f00000000f000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000eee000000eee00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000eee000000eee00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0ffeef0000ffeff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000eef000000eee00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00eeee00000eeee00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000f0f000000f0f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000f0f00000f000f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00550500005500050000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011111111
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011111111
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011111111
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011111111
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011111111
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011111111
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011111111
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011111111
dddddddddddadddd3b333b3311111111467744644446774446774464444677442677226222267722267722622226772200000000666666660000000011111111
dddddddddddadddd33b333b311111111467444644446744446744464444674442672226222267222267222622226722200000000606006060000000011111111
dddddddddddddddd3b333b3311111111666666666666666666666666666666666666666666666666666666666666666600055500606006060000000011111111
dddddddddddadddd33333333111111114444644496444464444464449644446422226222d622226222226222d622226200050aa0606006060000000011111111
dddddddddddaddddb333b333111111114444644496444464444464449644446422226222d622226222226222d622226200050aa0606006060000000011111111
dddddddddddadddd333b333b11111111666666666666666666666666666666666666666666666666666666666666666600050000606006060000000011111111
ddddddddddddddddb333b33311111111467744644446444446774464444644442677226222262222267722622226222200050000606006060000000011111111
dddddddddddadddd3333333311111111467444644446444446744464444644442672226222262222267222622226222200050000666666660000000011111111
dddddd7777ddddddcccccccc15111111666666666666666666666666666666666666666666666666666666666666666600050000000000000000000000000000
dddddd7777ddddddcccccccc15111111444464444644496444446444464449642222622226222d622222622226222d6200050000000000000000000000000000
dddddd7777ddddddcccccccc15111111444464444644496444446444464449642222622226222d622222622226222d6200050000000000000000000000000000
dddddd7777ddddddcccccccc11111111666666666666666666666666666666666666666666666666666666666666666600050000000000000000000000000000
dddddd7777ddddddcccccccc11111111467744644446774446774464444677442677226222267722267722622226772200050000000000000000000000000000
dddddd7777ddddddcccccccc11111111467444644446744446744464444674442672226222267222267222622226722200050000000000000000000000000000
dddddd7777ddddddcccccccc11111111666666666666666666666666666666666666666666666666666666666666666600050000000000000000000000000000
dddddd7777ddddddcccccccc11111111444467744644446444446774464444642222677226222262222267722622226700050000000000000000000000000000
66d11dd11dd11dd12662627626266222444467444644446444446744464444642222672226222262222267222622226700050000000000000000d11dd11dd11d
6d11dd11dd11dd11222222222222222266666666666666666666666666666666666666666666666666666666666666660005000000000000000d11dd11dd11d1
d11dd11dd11dd1112266262662762622496444464449644449644446444964442d622226222d622226222226222d6222000500000000000000d11dd11dd11d11
cccccccccccccc112222222222222222496444464449644449644446444964442d622226222d622226222226222d622200050000000000000099999999999911
cccccccccccccc112762662626266222666666666666666666666666666666666666666666666666666666666666666600050000000000000099999449999911
cccccccccccccc112222222222222222444467744644446444446774464444642222677226222262222267722622226200050000000000000099994444999911
cccccc77cccccc112662726262662622444467444644446444446744464444642222672226222262222267222622226200555000000000000099944444499911
ccccc7cc7ccccc112222222222222222666666666666666666666666666666666666666666666666666666666666666605555500000000000099997777999911
cccc7cccc7cccc112762627626266222496444464449644449644446444964442d622226222d622226222226222d62223b333b33444444440099997777999911
ccc7cccccc7ccc112222222222222222496444464449644449644446444964442d622226222d622226222226222d622233b333b3444444440099997177999911
ccc77c77c77ccc11226626266276262266666666666666666666666666666666666666666666666666666666666666663b333b33444444440099997177999911
cccccccccccccc112222222222222222444467744644446444446774464444642222677226222262222267722622226733333333444444440099bbbbbbb99911
cccccccccccccc1127626272662662224444674446444464444467444644446422226722262222622222672226222267b3334444444444440099999999999911
1111111111111c0022222222222222226666666666666666666666666666666666666666666666666666666666666666333b4444444444430011111111111101
c515556555565c5126626626227626224464444644446444446444464444644422622226222262222622222622226222b3334333b333b3430090000000000901
c616666666666c612222222222222222666666666666666666666666666666666666666666666666666666666666666633334b333b333b430090000000000900
__gff__
0000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000202000000000000001010101002101002020000000000000010101010021010020200000000000000
3030000000000000000000000000000031310000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001010100000000000000000001010000010110000000000000000000000000000101000000000000000000000000040401010000000000000000000000000404
__map__
bfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfe2e3000000000000bfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbf00000000000000000000000000000000000000000000000000e4e5e6e7e4e5e6e7e4e500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
bfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbff2f3000000000000bfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbf0000000000000000000000000000000000000000000000000000f4f5f6f7f4f5f6f7f4f500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c4c5c6c7c4c5c6c7c4c5c6c7c4c5c6c7bfe2e300000000e2e3bfc8c9cacbc8c9cacbc8c9cacbc8c9cacbbfbfbfbf000000c8c9cacbc8c9cacbc8c9cacbc8c9cacb64000000000000c44949c7c4644949c4c549000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
d4d5d6d7d4d5d6d7d4d5d6d7d4d5d6d7bff2f300000000f2f300d8d9dadbd8d9dadbd8d9dadbd8d9dadbbfbfbfbf000000d8d9dadbd8d9dadbd8d9da49d8d9dadb64000000000000d4d5d6d7d474d6d7d4d500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
e4e5e6e7e4e5e6e7e4e5e6e7e4e5e6e7bfe2e364494949e2e300e8e9eaebe8e9eaebe8e9eaebe8e9eaebbfbfbfbf000000e8e9eaebe8744949e8e9eaebe8e9eaeb74000000000000e4e5e6e7e474e6e7e4e500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
f4f5f6f7f4f5f6f7f4f5f6f7f4f5f6f7bff2f374e30000f2f300f8f94949f8f9fafb4949fafbf8f9fafb49bfbfbf000000f8f9fafbf864fafbf8f9fafbf8f949fb00000000000000f44949f7f4744949f4f549000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c4c5c6c7c4c5c6c7c4c5c6c7c4c5c6c7bfe2e364f300cfe2e300c8c9cacbc8c9cacbc8c9cacbc8c9cacbbfbfbfbf000000c8c9cacbc874cacbc8c9cacbc8c9cacb00000000000000c4c5c6c7c4c5c6c7c4c50000000000000047484748bf47484a4748bf004a0000000000000000000000000047484748bf4a4748bf4a000000
d4d5d6d7d4d5d6d7d4d5d6d7d4d5d6d7bff2f374f3bfbff2f3ccd8d9dadbd8d9dadbd8d9dadbd8d9dadbbfbfbfbf000000d8d9dadbd8d9dadbd8d9dadbd8d9dadb00000000000064d4d5d6d7d4d5d6d7d4d5000000cc000000575857585957585a575859005a0000000000000000000000000057585758595a5758595a000000
e4e0e1e7e4c3e6e7e0e1e6e7e4e0e1e7bfe2e364e3bfbfe2e3dce8e9eaebe8e9eaebe8e9eac3e8e9eaebbfbfbfbfbfbfcee8e9e0e1e8e9eaebe8e9eaebe8e9eaeb00000000000074e4e5e6e7e4e5e6e7e4e5cfbfcedcbfcecf676867686967686a6768006a000000656600000000000000000067686768696a6768696a00eeef
f4f0f1f7f4d3f6f7f0f1f6f7f4f0f1f7bff2f374f3bfbff2f3ecf8f9fafbf8f9fafbf8f9fad3f8f9fafbbfbfbfbfbfbfdef8f9f0f1f8f9fafbf8f9fafbf8f9fafb00000000000000f4f5f6f7f4f5f6f7f4f5dfdddeecdddedf777877787977787a7778007a004949757649490000000000000077787778797a7778797a00feff
c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0cdc0c0c0c0c0c0c0c0c0d1c0c0c1c0c0d0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0d1c0c0c1c0c0d0c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2d2d2d2d2d2d2d2d2d2d2d2d2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2
c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0d1c0c0c1c0c0d0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0d1c0c0c1c0c0d0c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2fcfdc2c2c2d2d2d2d2d2d2d2d2d2d2c2c2c2c2c2c2fcfdc2c2c2c2c2c2c2c2c2c2
c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0d1c0c0c1c0c0d0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0d1c0c0c1c0c0d0c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2d2d2d2d2d2d2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2
c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0d1c0c0c1c0c0d0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0d1c0c0c1c0c0d0c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2d2d2d2d2c2c2c2c2c2c2c2c2c2c2c2c2fcfdc2c2c2c2c2c2c2
c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0d1c0c0c1c0c0d0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0d1c0c0c1c0c0d0c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2
c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0d1c0c0c1c0c0d0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0d1c0c0c1c0c0d0c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2
c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2d1c0c0c1c0c0d0c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2d1c0c0c1c0c0d0c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2
00000000e2e3000000bf0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000bf00000000000000000000000000bf00bf000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000f2f3000000bf00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000e2e3490000bf00000000000000000000000000c4c5c6c7c4c5c6c70000c4c5c6c70000c8c9cacbc8c9cacb0000c4c5c6c7c4c5c6c70000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
e2e3e300f2f3000000bf00000000000000000000000000d4d5d6d7d4d5d6d70000d4d5d6d70000d8d9dadbd8d9dadb0000d4d5d6d7d4d5d6d70000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
e2e3e300e2e3000000bf00000000000000000000000000e4e5e6e7e4e5e6e70000e4e5e6e70000e8e9eaebe8e9eaeb0000e4e5e6e7e4e5e6e70000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
e2e3e300f2f3490000bf00000000000000000000000000f4f5f6f7f4f5f6f70000f4f5f6f70000f8f9fafbf8f9fafb0000f4f5f6f7f4f5f6f70000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
e2e3f3bfe2e3bfbf4abf00004748474800000047480000c4c5c6c7c4c5c6c70000c4c5c6c70000c8c9cacbc8c9cacb0000c4c5c6c7c4c5c6c70000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
e2f3f359f2f3bf59ccbf00005758575800000057580000d4d5d6d7d4d5d6d70000d4d5d6d70000d8d9dadbd8d9dadb0000d4d5d6d7d4d5d6d70000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
e2e0e169e2e3bf69dcbf00006768676800000067680000e4e5e6e7e4e5e6e70000e4e5e6e70000e8e9eaebe8e9eaeb0000e4e5e6e7e4e5e6e70000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
e2f0f179f2f3bf79ecbf00007778777800000077780000f4f5f6f7f4f5f6f70000f4f5f6f70000f8f9fafbf8f9fafb0000f4f5f6f7f4f5f6f70000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0
c2c2c2c2c2c2c2c2c2fcfdc2c2c2c2c2fcfdc2c2c2c2c2c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0
c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0
c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0
c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2
__sfx__
001800200c0450f04511045150451804515045110450f0420c0450f04511045150451804515045110450f0420e0451104515045180451a0451804515045110420e0451104515045180451a045180451504511042
011800000c313000001861518615306150d3000c313093000c313000001861518615246150000018615000000c31318611186151861524615000000c6150c3130c31300000186151861524615000001861500000
0118000018022180221802218022210222102221022210221f0221f0221f0221f0221b0221b0221b0221b0221a0221a0221a0221a02226022260222602226022240222402224022240221d0221d0221d0221d022
011800001824500000182451822500000000001f2451f2251f305000001d24521245242352122500000000001a245000001a2451a225002001d2451d2250020000200002001f24521245232351f2250000000000
011800001004513045170451804517045180451704513045100451304517045180451704518045170451304511045180451704515045110451804517045150451104518045170451504511045110421804218042
011800001c0221c0221c0221c02224022240222402224022230222302223022230221f0221f0221f0221f0221d0221d0221d0221d022240222402224022240221d0221d0221d0221d02229022290222902229022
011800001c0221c0221c0221c02224022240222402224022230222302223022230221f0221f0221f0221f022210222102221022210221d0221d0221d0221d022210222102221022210221d0221d0221d0221d022
01030000311103111031110000103b1103a11038110371103511033110000103a1103511031110000103211037110301100000000000000000000000000000000000000000000000000000000000000000000000
000100003f0503b050390503805036050340503205031050300502e0502c0502b05028050260502505023050210501e0501b0501a0501905014050120500f0500d0500b050080500505002050000500000000000
00020000046100561006610086100a6100d61010610156101c6101f6102561028610296102a6102a6102961027610246101f6101b6101861015610116100b6100761003610016100061012600126001160011600
000400000c742177420c742177420c742177420c742177320c732177320c722177220c722177220c712177120c712177120c712177120c712177120c712177120c71217702187022370218702237021870223702
01020000030500405006050080500b0500e050130501a05024050290502d0503305033050320502d050260501f05018050120500d0503e0003f0003f0003f0003f00000000000000000000000000000000000000
000500000a011110111a01121011280112c011250011c30116301113010c301063010230100301003010030100000000000000000000000000000000000000000000000000000000000000000000000000000000
011000002461018610246101861024610186102461018610000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
011800002453124531235312353122531225312153121531205312053120531205312052120521205112051100000000000000000000000000000000000000000000000000000000000000000000000000000000
011900002353216532235320f53100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000c00000c6130000000613000000c613000000061300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010500002d7212d7212c7212b7212872126721217211b721167211371112711117111100112001140010000000000000000000000000000000000000000000000000000000000000000000000000000000000000
011000003c6113c611306112461100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__music__
00 00414344
00 00014243
00 04014243
01 00010243
00 00010244
00 04010644
02 04010544

