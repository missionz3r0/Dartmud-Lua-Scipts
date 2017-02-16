local Inscribing = {}

sourceName = "inscribing"

local practiceCastMemory = {}
local practiceWriteMemory = {}
local channelMemory = {}

local function inscribe()
end

local function inscribeSetup(power, target)
end

local function load()
  Handlers.addPracticeInscribingListener(sourceName, practiceCastSetup)
end

local function unload()
  Handlers.removePracticeInscribingListener(sourceName, practiceCastSetup)
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
