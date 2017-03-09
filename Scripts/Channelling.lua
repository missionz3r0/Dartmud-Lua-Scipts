local Channelling = {}

local sourceName = "channelling"

local currentChannelPower = 1
local currentChannelTarget = ''

local function channel()
end

local function channellingSetup(args)
  local power = args["power"]
  local target = args["target"]
end

local function load()
  Events.addListener("channellingEvent", sourceName, channellingSetup)
end

local function unload()
  Handlers.removeListener("channellingEvent", sourceName)
end

local function reload()
  unload()
  load()
end

Channelling = {
  load = load
  ,unload = unload
  ,reload = reload
}

return Channelling
