
function love.resize(w, h)
  width, height = w, h
  scale = height / 1024
end

function love.load()
  if love.window.getWidth then
    love.resize(love.window.getWidth(), love.window.getHeight())
  end
end

function love.draw()
  love.graphics.print("Octopus server started on localhost:5773", 300, 300)
end
