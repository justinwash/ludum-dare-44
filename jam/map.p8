pico-8 cartridge // http://www.pico-8.com
version 16
__lua__

bg={
  celx=0,
  cely=0,
  sx=0,
  sy=0
}

function map_update()
  -- scroll map. breaks collision rn
  -- bg.sx -= 1
  -- if bg.sx < -127 then bg.sx = 0 end
end

function map_draw()
  map(bg.celx, bg.cely, bg.sx, bg.sy, 16 ,16)
  map(bg.celx, bg.cely, bg.sx + 128, bg.sy, 16 ,16)
end

function map_gettile(screenx, screeny)
  local x=flr(screenx/8)
  local y=flr(screeny/8)

  return mget(x,y)
end

function map_getflag(tile)
  return fget(tile)
end

function map_wouldcollide(x,y,w,h)
  for i=x-1,x+w,w do
    if map_getflag(map_gettile(i,y))>0
    or map_getflag(map_gettile(i,y+h-1))>0
    then
      return true
    end
  end

  return false
end