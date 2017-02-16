local Channelling = {}

local sourceName = "channelling"

local currentChannelPower = 1
local currentChannelTarget = ''

local function channel()
end

local function channellingSetup(power, target)
end

local function load()
  Handlers.addchannellingEventListener(sourceName, channellingSetup)
end

local function unload()
  Handlers.addchannellingEventListener(sourceName, channellingSetup)
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
