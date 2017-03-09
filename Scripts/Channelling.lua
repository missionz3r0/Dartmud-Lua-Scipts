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

local function load(args)
  Events.addListener("channellingEvent", sourceName, channellingSetup)
end

local function unload(args)
  Handlers.removeListener("channellingEvent", sourceName)
end

local function reload(args)
  unload(args)
  load(args)
end

Channelling = {
  load = load
  ,unload = unload
  ,reload = reload
}

return Channelling
