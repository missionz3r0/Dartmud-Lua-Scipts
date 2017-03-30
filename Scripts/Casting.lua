local Casting = {}

local sourceName = "casting"

local practiceCastMemory = {}

local currentSpell = ''
local currentSpellPower = 100
local currentSpellArguments = ''

local function practiceCast(args)
  send("cast ! "..currentSpell.." @ ".. currentSpellPower.. " "..currentSpellArguments)
end

local function practiceCastSetup(args)
  local spellName = args["spellName"]
  local power = args["power"]
  local spellArguments = args["spellArguments"]

  if power < 50 then
    power = 50
  end

  currentSpell = spellName
  currentSpellPower = power
  currentSpellArguments = spellArguments

  practiceCastMemory[currentSpell] = {}
  practiceCastMemory[currentSpell].power = power


  cecho("<yellow>Practice casting "..spellName.." @ "..currentSpellPower.." "..currentSpellArguments.."\n")

  Events.addListener("BEBTconcEvent", sourceName, practiceCast)
  send("conc")

  Casting.save()
end

local function practiceCastResume(args)
  local spellName = args["spellName"]
  if spellName == "" and currentSpell ~= "" then
    cecho("<yellow>Practice casting "..currentSpell.." @ "..currentSpellPower.." "..currentSpellArguments.."\n")
    Events.addListener("BEBTconcEvent", sourceName, practiceCast)

  elseif practiceCastMemory[spellName] then
    currentSpell = spellName
    currentSpellPower = practiceCastMemory[spellName].power
    currentSpellArguments = practiceCastMemory[spellName].arguments

    cecho("<yellow>Practice casting "..spellName.." @ "..currentSpellPower.." "..currentSpellArguments.."\n")

    Events.addListener("BEBTconcEvent", sourceName, practiceCast)
    send("conc")

    Casting.save()
  end
end

local function practiceCastStatus(args)
  local spellName = args["spellName"]
  if spellName == "" then
    cecho("<yellow>Status: Practice casting "..spellName.." @ "..currentSpellPower.." "..currentSpellArguments.."\n")
  elseif practiceCastMemory[spellName] then
    local power = practiceCastMemory[spellName].power
    cecho("<yellow>Status: Practiced casting "..spellName.." @ "..power.."\n")
  end
end

local function changePower(args)
  local spellPower = args["power"]

  currentSpellPower = power

  cecho("<yellow>Practice casting "..currentSpellName.." @ "..currentSpellPower.." "..currentSpellArguments.."\n")
  practiceCastMemory[currentSpell].power = power

  Casting.save()
end

local function practiceCastOff(args)
  cecho("<yellow>Stopped casting\n")
  Events.removeListener("BEBTconcEvent", sourceName)
end

local function loaderFunction(sentTable)
  if sentTable then
    practiceCastMemory = sentTable["practiceCastMemory"] or {}
    currentSpell = sentTable["currentSpell"] or ""
    currentSpellPower = sentTable["currentSpellPower"] or 100
  end
end

local function load()
  Events.raiseEvent("loadEvent",
                   {sourceName = sourceName, functionToSendData = loaderFunction})
end

local function save()
  Events.raiseEvent("saveEvent",
                    {
                    sourceName = sourceName
                    ,tableToSave = {
                        practiceCastMemory = practiceCastMemory
                        ,currentSpell = currentSpell
                        ,currentSpellPower = currentSpellPower
                      }
                    })
end

local function setup(args)
  Events.addListener("practiceCastEvent",sourceName, practiceCastSetup)
  Events.addListener("practiceCastResumeEvent",sourceName, practiceCastResume)
  Events.addListener("practiceCastOffEvent",sourceName, practiceCastOff)
  Events.addListener("practiceCastStatusEvent",sourceName, practiceCastStatus)
end

local function unsetup(args)
  Events.removeListener("practiceCastEvent",sourceName)
  Events.removeListener("practiceCastResumeEvent",sourceName)
  Events.removeListener("practiceCastOffEvent",sourceName)
  Events.removeListener("practiceCastStatusEvent",sourceName)
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
  ,save = save
}

return Casting
