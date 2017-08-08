local Update = {}

local sourceName = "update"

local url = "https://codeload.github.com/missionz3r0/Dartmud-Lua-Scipts/zip/development"

local function download(path)
  local saveTo = path.."package_download.zip"
  if (getMudletVersion) then
    if io.exists(path) then
    	--downloadFile(saveTo, url)
    else
      lfs.mkdir(path)
    	--downloadFile(saveTo, url)
    end
  end
end

local function downloadFinished(args)
  local file = args["file"]
end


function downloadError(args)
  local error = args["error"]
  local url = args["url"]
  print("Error: "..error)
	print("While downloading file from: "..url)
end

local function setup(args)
  local isFirstLoad = args["isFirstLoad"]
  local directory = args["directory"]

  --download(directory)

  Events.addListener("sysDownloadError", sourceName, downloadError)
end

local function unsetup(args)
  Events.removeListener("sysDownloadError", sourceName)
end

local function resetup(args)
  unsetup(args)
  setup(args)
end

Update = {
  setup = setup
  ,unsetup = unsetup
  ,resetup = resetup
}

return Update
