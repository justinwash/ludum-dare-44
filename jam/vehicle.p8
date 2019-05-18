pico-8 cartridge // http://www.pico-8.com
version 16
__lua__

vehicle={
  x=86,
  y=127,
  behind=true
}

function vehicle_update()
  if currentlevel == 1 then
    if map_getPage()==2 then
      if vehicle.behind then
        vehicle.y-=1
        if vehicle.y<62 then vehicle.behind=false end
      else 
        vehicle.y+=1
        if vehicle.y>200 then vehicle.behind=true end
      end

      vehicle_hit()
    end
  end
end

function vehicle_draw()
  if currentlevel == 1 then
    if vehicle.behind and map_getPage()==2 then
      spr(64,vehicle.x,vehicle.y,2,2)
      rectfill(vehicle.x,80,vehicle.x+16,127,13)
      spr(64,vehicle.x+28,vehicle.y,2,2)
    elseif not vehicle.behind and map_getPage()==2 then
      spr(64,vehicle.x,vehicle.y,2,2)
      spr(64,vehicle.x+28,vehicle.y,2,2)
      rectfill(vehicle.x+28,80,vehicle.x+28+16,127,13)
    end
  end
end

function vehicle_hit()
  if currentlevel == 1 then
    if ((abs(vehicle.x-player.x)<8 and abs(vehicle.y-player.y-7)<8) 
    or (abs(vehicle.x+28-player.x)<8 and abs(vehicle.y-player.y-7)<8)) and player.invuln<60 then
      player.lives-=1
      player.invuln=120
      cameraoffset=1
      sfx(7)
      --player.dx-=2
    end
  end
end