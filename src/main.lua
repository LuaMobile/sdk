--[[ LuaMobile SDK

This is just an example main.lua file, change or replace it at will.

]]

function love.load()
  love.graphics.setNewFont(30)
end

function love.draw()
  local screenW, screenH = love.graphics.getWidth(), love.graphics.getHeight()

  love.graphics.printf(
    (
      "Welcome to LuaMobile SDK!\n" ..
      "Screen size: %s x %s\n\n" ..
      "Powered by LÖVE"
    ):format(screenW, screenH), 0, screenH * 0.2, screenW, 'center'
  )
end
