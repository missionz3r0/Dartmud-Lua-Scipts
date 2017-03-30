local Casting_Aliases = {}

local aliases = {}

local function setup(args)
  tempAliases = {}

  --Practice casting alias
  tempAliases.practiceCast =
    tempAlias("\\/[Cc][Aa][Ss][Tt] ! (\\w+) @ (\\d+)(?: ([\\w,\\s]+))?"
              ,[[
                local spellName = string.lower(matches[2])
                local power = tonumber(matches[3]) or 100
                local spellArguments = matches[4] or ""
                local arguments = {
                  spellName = spellName
                  ,power = power
                  ,spellArguments = spellArguments
                }

                Events.raiseEvent("practiceCastEvent", arguments)
              ]])

  tempAliases.practiceCastResume =
    tempAlias("\\/[Cc][Aa][Ss][Tt] ! [Rr][Ee][Ss][Uu][Mm][Ee](?: (\\w+))?"
             ,[[
              spellName = matches[2] or ""
              spellName = string.lower(spellName)
              local arguments = {spellName = spellName}
              Events.raiseEvent("practiceCastResumeEvent", arguments)
             ]])

 tempAliases.practiceCastOff =
   tempAlias("\\/[Cc][Aa][Ss][Tt] ! [Oo][Ff][Ff]"
            ,[[
             local arguments = {}
             Events.raiseEvent("practiceCastOffEvent", arguments)
            ]])

tempAliases.practiceCastStatus =
  tempAlias("\\/[Cc][Aa][Ss][Tt] ! [Ss][Tt][Aa][Tt][Uu][Ss](?: [Oo][Ff] (\\w+))?"
           ,[[
            local spellName = matches[2] or ""
            spellName = string.lower(spellName)
            local arguments = {spellName = spellName}
            Events.raiseEvent("practiceCastStatusEvent", arguments)
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

Casting_Aliases =
{
  setup = setup
  ,unsetup = unsetup
  ,resetup = resetup
}

return Casting_Aliases
