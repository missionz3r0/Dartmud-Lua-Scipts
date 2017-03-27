local Channelling = {}

local sourceName = "channelling"

local currentChannelPower = 1
local currentChannelTarget = ''
local currentChannelCount = 0

local function channel()
  send("channel "..currentChannelPower.. " "..currentChannelTarget)
  currentChannelCount = currentChannelCount + currentChannelPower
  cecho("<yellow>Channelled "..currenChannelCount.." to "..currentChannelTarget.."\n")
end

local function channellingSetup(args)
  local power = args["power"]
  local target = args["target"]

  currentChannelPower = tonumber(power)
  currentChannelTarget = target
  currentChannelCount = 0
  Events.addListener("BEBTconcEvent", sourceName, channel)
  send("conc")
  cecho("<yellow>Channelling "..currentChannelPower.." to "..currentChannelTarget.."\n")
end

local function channellingCommands(args)
  command = args["command"] or ''
  if command == "off" then
    Events.removeListener("BEBTconcEvent", sourceName)
    cecho("<yellow>Channelling off")
  elseif command == "resume" then
    Events.addListener("BEBTconcEvent", sourceName, channel)
    cecho("<yellow>Resuming channelling "..currentChannelPower.." to "..currentChannelTarget.."\n")

  elseif command == "info" or command == "status" then
    cecho("<yellow>Currently channelling "..currentChannelPower.." to "..currentChannelTarget.."\n")

  else
    cecho(command.." is invalid. Valid commands are off, resume, info, or status.")
  end
end

local function load(args)
  Events.addListener("channellingEvent", sourceName, channellingSetup)
    Events.addListener("channellingCommandEvent", sourceName, channellingCommands)
end

local function unload(args)
  Events.removeListener("channellingEvent", sourceName)
    Events.removeListener("channellingCommandEvent", sourceName)
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
