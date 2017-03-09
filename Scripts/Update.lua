local Update = {}

local sourceName = "update"

local url = "https://github.com/missionz3r0/Dartmud-Lua-Scipts/archive/development.zip"
local savePath = getMudletHomeDir().."/scripts/update.zip"

local function download()
  if getMudletVersion ~= nill then
    if io.exists(path) then
    	downloadFile(saveTo, url)
    else
      lfs.mkdir(path)
    	downloadFile(saveTo, url)
    end
  end
end


function downloadError(var2, var3)
	print("Var2: "..var2.."\n")
	print("Var3: "..var3.."\n")
end

local function load()
  Events.addListener("loginEvent", sourceName, download)
  Events.addListener("sysDownloadError", sourceName, download)
end

local function unload()
  Events.removeListener("loginEvent", sourceName)
  Events.removeListener("sysDownloadError", sourceName)
end

local function reload()
  unload()
  load()
end

Update = {
  load = load
  ,unload = unload
  ,reload = reload
}

return Update
