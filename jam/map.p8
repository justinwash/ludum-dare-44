pico-8 cartridge // http://www.pico-8.com
version 16
__lua__

bg={
  x=0,
  y=0
}

function map_update()
  bg.x -= 1
  if bg.x < -127 then bg.x = 0 end
end

function map_draw()
  map(0, 0, bg.x, bg.y, 16 ,16)
  map(0, 0, bg.x + 128, bg.y, 16 ,16)
end