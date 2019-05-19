local Power_Casting = {}

local sourceName = "power_casting"

aliases = {}

local target = {}
local count = {}
local power = {}
local isPracticeCasting = false

--Practice casting hook-in

local function resumePracticeCasting()
    Events.removeListener("channeledEvent", sourceName)
    Events.raiseEvent("channelOffEvent", {})
    tempTimer(1
      ,[[
        Events.raiseEvent("practiceCastResumeEvent", {spellName = ""})
      ]]
    )
end

--End practice casting hook-in

local function powerCast(args)
  local sc_count = tonumber(Skills.getSkill({who = "Sonea", skill_name = "spell casting"}).count)
  send("cast ! lg @ "..sc_count.."00")
  send("set mind to open")
  Events.removeListener("BEBTconcEvent", sourceName)
  Events.raiseEvent("channelSetupEvent", {target = target, power = power})
end

local function discharge(args)
  send("discharge "..target)
  send("set mind to isolated")
  Events.removeListener("BEBTconcEvent", sourceName)
  Events.addListener("BEBTconcEvent",sourceName, powerCast)
end

local function checkCount(args)
  count = args["count"]
  target = args["target"]
  power = args["power"]


  local sc_count = tonumber(Skills.getSkill({who = "Sonea", skill_name = "spell casting"}).count)

  if(count*8.2 > sc_count) then
    Events.removeListener("BEBTconcEvent", "channelling")
    Events.addListener("BEBTconcEvent", sourceName, discharge)
  elseif isPracticeCasting then
    resumePracticeCasting()
  end
end

--Practice Casting Hook-in

local function stopPracticeCasting(args)
  Events.raiseEvent("practiceCastPauseEvent", args)
  Events.addListener("channeledEvent", sourceName, checkCount)
  Events.raiseEvent("channelResumeEvent", {target=""})
end

local function setupForPracticeCasting(args)
  isPracticeCasting = true
  Events.addListener("finishPracticingEvent", sourceName, stopPracticeCasting)
end

local function practiceCastOff(args)
  isPracticeCasting = false
  Events.removeListener("finishPracticingEvent", sourceName)
  Events.raiseEvent("channelOffEvent", args)
end

--End practice casting hook-in

local function powerCastSetup(args)
  Events.raiseEvent("messageEvent", {message="<yellow>Power Casting"})
  Events.addListener("channeledEvent", sourceName, checkCount)
end

local function powerCastOff(args)
  Events.raiseEvent("messageEvent", {message="<yellow>Power Casting"})
  Events.raiseEvent("channelOffEvent", args)
  Events.removeListener("channeledEvent", sourceName)
end

local function setup(args)
  tempAliases = {}

  tempAliases.power_cast =
    tempAlias("\\/[Pp][Oo][Ww][Ee][Rr] [Cc][Hh][Aa][Nn][Nn][Ee][Ll] (\\d+) (\\w+)"
              ,[[
                local power = tonumber(matches[2])
                local target = string.lower(matches[3])
                local arguments = {power = power, target = target}

                Events.raiseEvent("powerCastSetupEvent", arguments)
                Events.raiseEvent("channelSetupEvent", arguments)
              ]])


    tempAliases.channelOff =
    tempAlias("^\\/[Pp][Oo][Ww][Ee][Rr] [Cc][Hh][Aa][Nn][Nn][Ee][Ll] [Oo][Ff][Ff]"
        ,[[
          Events.raiseEvent("powerCastOffEvent", arguments)
        ]])

  Events.addListener("powerCastSetupEvent", sourceName, powerCastSetup)
  Events.addListener("powerCastOffEvent", sourceName, powerCastOff)

  Events.addListener("practiceCastEvent", sourceName, setupForPracticeCasting)
  Events.addListener("practiceCastResumeEvent", sourceName, setupForPracticeCasting)
  Events.addListener("practiceCastOffEvent",sourceName, practiceCastOff)

  aliases = tempAliases
end

local function unsetup(args)
  Events.removeListener("powerCastSetupEvent", sourceName)
  Events.removeListener("powerCastOffEvent", sourceName)

  Events.removeListener("practiceCastEvent", sourceName)
  Events.removeListener("practiceCastResumeEvent", sourceName)
  Events.removeListener("practiceCastOffEvent",sourceName)

  for i,v in pairs(aliases) do
    killAlias(v)
  end
end

local function resetup(args)
  unsetup(args)
  setup(args)
end

Power_Casting= {
  setup = setup
  ,unsetup = unsetup
  ,resetup = resetup
}

return Power_Casting
