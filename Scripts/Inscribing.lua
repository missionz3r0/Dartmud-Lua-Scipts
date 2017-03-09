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

local function load(args)
  Events.addListener("practiceInscribingEvent", sourceName, inscribeSetup)
end

local function unload(args)
  Events.removeListener("practiceInscribingEvent", sourceName)
end

local function reload(args)
  unload(args)
  load(args)
end

Inscribing = {
  load = load
  ,unload = unload
  ,reload = reload
}

return Inscribing
