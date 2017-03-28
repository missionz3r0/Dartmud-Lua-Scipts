local Casting = {}

local sourceName = "casting"

local currentSpellPractice = ''
local currentSpellPower = 100
local currentSpellArguments = ''

local function practiceCast(args)
  send("cast "..currentSpellPractice.." @ ".. currentSpellPower.. " "..currentSpellArguments)
end

local function practiceCastSetup(spellName, power, arguments)
  if spellName == "off" then
    Events.removeListener("BEBTconcEvent", sourceName)

  elseif spellName == "resume" then
    Events.addListener("BEBTconcEvent", sourceName, practiceCast)

  elseif spellName == "info" or spellName == "status" or spellName == "" then
    cecho("Currently casting "..currentSpellPractice.." @ "..currentSpellPower.." "..arguments)

  else
    if power < 50 then
      power = 50
    end

    if currentSpellPractice ~= '' then
      practiceCastMemory[currentSpellPractice] = {}
      practiceCastMemory[currentSpellPractice].power = power
      practiceCastMemory[currentSpellPractice].arguments = arguments
    end


    currentSpellPractice = spell
    currentSpellPower = power
    currentSpellArguments = arguments

    Events.addListener("BEBTconcEvent", sourceName, practiceCast)
  end
end

local function load()
  Events.raiseEvent("loadEvent",sourceName,
                   function(sentTable)
                   end)
end

local function save()
  Events.raiseEvent("saveEvent",sourceName,
                    {
                    })
end

local function setup(args)
  Events.addListener("PracticeCastEvent",sourceName, practiceCastSetup)
end

local function unsetup(args)
  Events.removeListener("PracticeCastEvent",sourceName)
end

local function resetup(args)
  unsetup(args)
  setup(args)
end

Casting = {
  setup = setup
  ,unsetup = unsetup
  ,resetup = resetup
  ,load = load
}

return Casting
