local Channelling_Aliases = {}

local aliases = {}

local function setup(args)
  tempAliases = {}

  --Channelling alias
  tempAliases.channel =
    tempAlias("\\/[Cc][Hh][Aa][Nn][Nn][Ee][Ll] (\\d+) (\\w+)"
              ,[[
                local power = tonumber(matches[2])
                local target = string.lower(matches[3])
                local arguments = {power = power, target = target}

                Events.raiseEvent("channelSetupEvent", arguments)
              ]])

  --Channel resume
  tempAliases.channelResume =
    tempAlias("\\/[Cc][Hh][Aa][Nn][Nn][Ee][Ll] [Rr][Ee][Ss][Uu][Mm][Ee](?: (\\w+))?"
              ,[[
                local target = matches[2] or ""
                target = string.lower(target)
                local arguments = {target = target}

                Events.raiseEvent("channelResumeEvent", arguments)
              ]])

  --Channel off
  tempAliases.channelOff =
    tempAlias("\\/[Cc][Hh][Aa][Nn][Nn][Ee][Ll] [Oo][Ff][Ff]"
              ,[[
                Events.raiseEvent("channelOffEvent", arguments)
              ]])

  --Channel status
  tempAliases.channelStatus =
    tempAlias("\\/[Cc][Hh][Aa][Nn][Nn][Ee][Ll] [Ss][Tt][Aa][Tt][Uu][Ss](?: [Oo][Ff] (\\w+))?"
              ,[[
                 local target = matches[2] or ""
                 target = string.lower(target)
                 arguments = {target = target}
                 Events.raiseEvent("channelStatusEvent", arguments)
              ]])

  --Channel change target
  tempAliases.channelTarget =
    tempAlias("\\/[Cc][Hh][Aa][Nn][Nn][Ee][Ll] [Tt][Aa][Rr][Gg][Ee][Tt] ?= ?(\\w+)"
              ,[[
                 local target = matches[2]
                 target = string.lower(target)
                 arguments = {target = target}
                 Events.raiseEvent("channelTargetEvent", arguments)
              ]])

  --Channel change power
  tempAliases.channelPower =
    tempAlias("\\/[Cc][Hh][Aa][Nn][Nn][Ee][Ll] [Pp][Oo][Ww][Ee][Rr] ?= ?(\\w+)"
              ,[[
                 local power = matches[2] or ""
                 power = tonumber(power)
                 arguments = {power = power}
                 Events.raiseEvent("channelPowerEvent", arguments)
              ]])

  aliases = tempAliases
end

local function unsetup(args)
  for i,v in pairs(aliases) do
    killAlias(v)
  end
end

local function resetup(args)
  unsetup(args)
  setup(args)
end

Channelling_Aliases =
{
  setup = setup
  ,unsetup = unsetup
  ,resetup = resetup
}

return Channelling_Aliases
