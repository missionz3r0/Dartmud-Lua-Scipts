local Inscribing = {}

sourceName = "inscribing"

local practiceCastMemory = {}
local practiceWriteMemory = {}
local channelMemory = {}

local function inscribe()
end

local function inscribeSetup(args)
  local power = args["power"]
  local arguments = args["arguments"]
end

local function load()
  Events.addListener("practiceInscribingEvent", sourceName, inscribeSetup)
end

local function unload()
  Events.removeListener("practiceInscribingEvent", sourceName)
end

local function reload()
  unload()
  load()
end

Inscribing = {
  load = load
  ,unload = unload
  ,reload = reload
}

return Inscribing
