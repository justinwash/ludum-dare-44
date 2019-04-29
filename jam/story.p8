pico-8 cartridge // http://www.pico-8.com
version 16
__lua__

function story_show()
  texty=102
  textoffset=8
  game.upd = story_update
  game.draw = story_draw
end

function story_update()
  if t%10==0 then texty-=1 end
  if btnp(btn1) then buy_show() end
end

function story_draw()
  cls(blue)

  rectfill(19,10,113,22,dark_blue)
  rectfill(17,8,111,20,red)
  print('don\'t die dumpstercat!',21,12,white)

  rectfill(8,30,122,110,dark_blue)
  rectfill(6,28,120,108,red)
  if texty>30 and texty<103 then print('oh look... a dumpster cat...',8,texty,white) end
  if texty+textoffset>30 and texty+textoffset<103 then print('taki? of house dumpster?',8,texty+textoffset,white) end
  if texty+textoffset*2>30 and texty+textoffset*2<103 then print('funny name...',8,texty+textoffset*2,white) end
  if texty+textoffset*3>30 and texty+textoffset*3<103 then print('i must warn you street cat:',8,texty+textoffset*3,white) end
  if texty+textoffset*4>30 and texty+textoffset*4<103 then print('these alleys are treacherous',8,texty+textoffset*4,white) end
  if texty+textoffset*5>30 and texty+textoffset*5<103 then print('your foes fur-midable',8,texty+textoffset*5,white) end
  if texty+textoffset*6>30 and texty+textoffset*6<103 then print('but there are ways...',8,texty+textoffset*6,white) end
  if texty+textoffset*7>30 and texty+textoffset*7<103 then print('to gain paw-wer',8,texty+textoffset*7,white) end
  if texty+textoffset*8>30 and texty+textoffset*8<103 then print('it will cost you...',8,texty+textoffset*8,white) end
  if texty+textoffset*9>30 and texty+textoffset*9<103 then print('your life!',8,texty+textoffset*9,white) end
  if texty+textoffset*10>30 and texty+textoffset*10<103 then print('or lives... you have 9',8,texty+textoffset*10,white) end
  if texty+textoffset*11>30 and texty+textoffset*11<103 then print('for now',8,texty+textoffset*11,white) end
  if texty+textoffset*12>30 and texty+textoffset*12<103 then print('spend them wisely',8,texty+textoffset*12,white) end
  if texty+textoffset*13>30 and texty+textoffset*13<103 then print('(or don\'t)',8,texty+textoffset*13,white) end
  if texty+textoffset*14>30 and texty+textoffset*14<103 then print('you will need many',8,texty+textoffset*14,white) end
  if texty+textoffset*15>30 and texty+textoffset*15<103 then print('to cross the cement desert',8,texty+textoffset*15,white) end
  if texty+textoffset*17>30 and texty+textoffset*17<103 then print('good fur-tune...',8,texty+textoffset*17,white) end
  if texty+textoffset*18>30 and texty+textoffset*18<103 then print('on the journey ahead',8,texty+textoffset*18,white) end
  print("press [z] to continue", 23, 118, 7)
end