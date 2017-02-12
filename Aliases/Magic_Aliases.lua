local Magic = {}

local aliases = {}

local practiceCastMemory = {}
local practiceWriteMemory = {}
local channelMemory = {}

local currentSpell = 'lg'
local currentPower = 100
local currentArguments = ''

local function practiceCast(conc)
  send("cast "..currentSpell.." @ ".. currentPower.. " "..currentArguments)
end

local function practiceCastSetup(spell, power, arguments)


  if spellName == "off" then
    Handlers.removeBEBTconcEventListener("practiceCast")

  elseif spellName == "resume" then
    Handlers.addBEBTconcEventListener("practiceCast", practiceCast)

  elseif action == "info" or "status" then
    cecho("Currently casting "..currentSpell.." @ "..currentPower.." "..arguments)

  else
    if power < 50 then
      power = 50
    end

    practiceCastMemory[currentSpell] = {}
    practiceCastMemory[currentSpell].power = power
    practiceCastMemory[currentSpell].arguments = arguments


    currentSpell = spell
    currentPower = power
    currentArguments = arguments

    Handlers.addBEBTconcEventListener("practiceCast", practiceCast)
  end

end

local function load()
  tempAliases = {}

  --Practice casting alias
  tempAliases.practiceCast =
    tempAlias("\/cast ! (\w+)(?: @ (\d+))(?: ([\w,\s]+))?"
              ,[[
                local spellName = matches[2]
                local power = tonumber(matches[3]) or 100
                local arguments = matches[4] or ""

                raiseEvent("practiceCastEvent", spellName, power, arguments)
              ]])

  --Channelling alias
  tempAliases.channelling =
    tempAlias("\/channel (\w+)(?: (\w+))?"
              ,[[
                local power = tonumber(matches[2])
                local target = matches[3]

                raiseEvent("channellingEvent", power, target)
              ]])

  --Practice writing alias
tempAliases.practiceInsribing =
  tempAlias("\/inscribe ! (\w+)(?: @ (\d+))?"
            ,[[
              local spell = matches[2]
              local power = tonumber(matches[3]) or 100

              raiseEvent("practiceInscribingEvent", spell, power)
            ]])



  --Repeat casting alias
  tempAliases.repeatCasting = ''

  Handlers.addpracticeCastEventListener("practiceCastSetup") = practiceCastSetup

  aliases = tempAliases
end

local function unload()
  for i,v in pairs(aliases) do
    killAlias(v)
  end

  Handlers.removepracticeCastEventListener("practiceCastSetup") = practiceCastSetup
end

local function reload()
  unload()
  reload()
end

Cast =
{
  load = load
  ,unload = unload
  ,reload = reload
}

return Magic
