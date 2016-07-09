local fs = love.filesystem
local saveDirectory

function love.error_log(message)
  if type(message) == 'string' then
    local fh = io.open(saveDirectory .. "/debug.log", "a+")
    fh:write(message)
    fh:close()
  end
end

function binaryCopy(src, dst)
  local fh, data

  data = fs.read(src)

  fh = io.open(dst, "w")
  fh:write(data)
  fh:close()
end

function copyStaticLibraries(tree)
  assert(fs.isDirectory(tree), "Destination folder is not valid!")

  local files = {}

  -- Copy directory tree
  for i,v in ipairs(fs.getDirectoryItems(tree)) do
    local filepath = tree .. "/" .. v
    if fs.isFile(filepath) then
      files[#files + 1] = {src = filepath, dst = saveDirectory .. "/" .. filepath}
    elseif fs.isDirectory(filepath) then
      fs.createDirectory(filepath)
      fileTree = copyStaticLibraries(filepath)
    end
  end

  -- Copy files
  for _, file in pairs(files) do
    binaryCopy(file.src, file.dst)
  end
end

-- Install static libraries into the game save directory. Only once per game
-- installation. If game is uninstalled, copied libraries will do as well.
function installStaticLibraries()
  if not os.rename(saveDirectory .. "/lib", saveDirectory .. "/lib") then
    fs.createDirectory "lib"
    fs.copyStaticLibraries "lib"
  end
end

fs.copyStaticLibraries = copyStaticLibraries

function love.conf(t)
  -- Determines the name of the save directory for your game.
  t.identity = "luamobile"
  fs.setIdentity(t.identity)
  saveDirectory = fs.getSaveDirectory()

  -- Add share/ folder to package loader
  love.filesystem.setRequirePath(table.concat{
    "share/?.lua;share/?/init.lua;share/?/?.lua;share/?/?/init.lua;",
    love.filesystem.getRequirePath(),
  })

  -- Add lib/ folder to package loader
  local saveDirectory = love.filesystem.getSaveDirectory()
  package.cpath = table.concat({
    saveDirectory .. "/lib/?.so", saveDirectory .. "/lib/?/?.so",
    package.cpath,
  }, ";")

  installStaticLibraries()
end
