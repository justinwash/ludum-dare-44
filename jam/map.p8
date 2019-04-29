pico-8 cartridge // http://www.pico-8.com
version 16
__lua__

bg={
  celx=0,
  cely=0,
  sx=0,
  sy=0,
  page=0
}

function map_update()
  vehicle_update()
  girl_update()
end

function map_draw()
  map(bg.celx, bg.cezxzzly, bg.sx, bg.sy, 16 ,16)
  map(bg.celx, bg.cely, bg.sx + 128, bg.sy, 16 ,16)
  
  vehicle_draw()
  girl_draw()
end

function map_gettile(screenx, screeny)
  local x=flr(screenx/8 + bg.celx) 
  local y=flr(screeny/8 + bg.cely)

  -- printh("screenx: " .. screenx)
  -- printh("bg: (" .. bg.sx .. ", " .. bg.sy .. ")")
  -- printh("cel: (" .. bg.celx .. ", " .. bg.cely .. ")")
  -- printh("map page: " .. bg.page)

  return mget(x,y)
end

function map_goToPage(page) 
  bg.celx = page * 16
end

function map_shouldScroll() 

  local sizeFactor = 8
  local scrollFactor = 16

  if player.x > 127 then
    bg.celx += scrollFactor
    player.x -= scrollFactor * sizeFactor
    pigeon_offset(-127)
    bg.page+=1
  end

  if player.x < 0 and bg.page > 0 then 
    bg.celx -= scrollFactor
    player.x += scrollFactor * sizeFactor
    pigeon_offset(127)
    bg.page-=1
  end

  
end

function map_getflag(tile)
  return fget(tile)
end

function map_wouldcollide(x,y,w,h)
  colliding=false
  y=y+h/2
  h=h/2
  for i=x+1,x+w-2,1 do
    if map_getflag(map_gettile(i,y))==1
    or map_getflag(map_gettile(i,y+h-1))==1
    then
      colliding=true
    end
  end
  return colliding
end

function map_getPage() 
  return bg.page
end