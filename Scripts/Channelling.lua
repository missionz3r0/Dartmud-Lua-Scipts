local Channelling = {}

local sourceName = "channelling"

local channelHistory = {}

local currentChannelTarget = ''

local function channel()
  local power = channelHistory[currentChannelTarget].power
  local count = channelHistory[currentChannelTarget].count
  send("channel "..power.. " "..currentChannelTarget)
  count = count + currentChannelPower
  cecho("<yellow>Channelled "..count.." to "..currentChannelTarget.."\n")
  channelHistory[currentChannelTarget].count = count
end

local function channellingSetup(args)
  local power = args["power"]
  local target = args["target"]

  currentChannelTarget = target
  channelHistory[target] = {power = tonumber(power), count = 0}

  Events.addListener("BEBTconcEvent", sourceName, channel)
  send("conc")
  cecho("<yellow>Channelling "..power.." to "..target.."\n")
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

local function load()
  Events.raiseEvent("loadEvent",sourceName,
                   function(sentTable)
                     channelHistory = sentTable
                   end)
end

local function save()
  Events.raiseEvent("saveEvent",sourceName,channelHistory)
end

local function setup(args)
  Events.addListener("channellingEvent", sourceName, channellingSetup)
  Events.addListener("channellingCommandEvent", sourceName, channellingCommands)
end

local function unsetup(args)
  Events.removeListener("channellingEvent", sourceName)
  Events.removeListener("channellingCommandEvent", sourceName)
end

local function resetup(args)
  unsetup(args)
  setup(args)
end

Channelling = {
  setup = setup
  ,unsetup = unsetup
  ,resetup = resetup
  ,load = load
}

return Channelling
