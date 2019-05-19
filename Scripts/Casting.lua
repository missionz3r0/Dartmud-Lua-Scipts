local Casting = {}

local sourceName = "casting"

local practiceCastMemory = {}

local currentSpell = ''
local currentSpellPower = 100
local currentSpellArguments = ''
local isActive = false

local function practiceCast(args)
  send("cast ! "..currentSpell.." @ ".. currentSpellPower.. " "..currentSpellArguments)
  Events.removeListener("BEBTconcEvent", sourceName)
end

local function practiceCastSetup(args)
  isActive = true
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


  Events.raiseEvent("messageEvent", {message="<yellow>Practice casting "..spellName.." @ "..currentSpellPower.." "..currentSpellArguments.."\n"})

  Events.addListener("BEBTconcEvent", sourceName, practiceCast)

  Casting.save()
end

local function practiceCastResume(args)
  isActive = true
  local spellName = args["spellName"]
  if spellName == "" and currentSpell ~= "" then
    Events.raiseEvent("messageEvent", {message="<yellow>Practice casting "..currentSpell.." @ "..currentSpellPower.." "..currentSpellArguments.."\n"})
    Events.addListener("BEBTconcEvent", sourceName, practiceCast)

  elseif practiceCastMemory[spellName] then
    currentSpell = spellName
    currentSpellPower = practiceCastMemory[spellName].power
    currentSpellArguments = practiceCastMemory[spellName].arguments

    Events.raiseEvent("messageEvent", {message="<yellow>Practice casting "..spellName.." @ "..currentSpellPower.." "..currentSpellArguments.."\n"})

    Events.addListener("BEBTconcEvent", sourceName, practiceCast)

    Casting.save()
  end
end

local function practiceCastStatus(args)
  local spellName = args["spellName"]
  if spellName == "" then
    Events.raiseEvent("messageEvent", {message="<yellow>Status: Practice casting "..spellName.." @ "..currentSpellPower.." "..currentSpellArguments.."\n"})
  elseif practiceCastMemory[spellName] then
    local power = practiceCastMemory[spellName].power
    Events.raiseEvent("messageEvent", {message="<yellow>Status: Practiced casting "..spellName.." @ "..power.."\n"})
  end
end

local function changePower(args)
  local spellPower = args["power"]

  currentSpellPower = power

  Events.raiseEvent("messageEvent", {message="<yellow>Practice casting "..currentSpellName.." @ "..currentSpellPower.." "..currentSpellArguments.."\n"})
  practiceCastMemory[currentSpell].power = power

  Casting.save()
end

local function practiceCastOff(args)
  isActive = false
  Events.raiseEvent("messageEvent", {message="<yellow>Stopped casting\n"})
  Events.removeListener("BEBTconcEvent", sourceName)
end

local function finishPracticing(args)
  if isActive then
      Events.addListener("BEBTconcEvent", sourceName, practiceCast)
  end
end

local function loaderFunction(sentTable)
  if sentTable then
    practiceCastMemory = sentTable["practiceCastMemory"] or {}
    currentSpell = sentTable["currentSpell"] or ""
    currentSpellPower = sentTable["currentSpellPower"] or 100
    currentSpellArguments = sentTable["currentSpellArguments"] or ""
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
                        ,currentSpellArguments = currentSpellArguments
                      }
                    })
end

local function setup(args)
  Events.addListener("practiceCastEvent",sourceName, practiceCastSetup)
  Events.addListener("practiceCastResumeEvent",sourceName, practiceCastResume)
  Events.addListener("practiceCastPauseEvent",sourceName, practiceCastOff)
  Events.addListener("practiceCastOffEvent",sourceName, practiceCastOff)
  Events.addListener("practiceCastStatusEvent",sourceName, practiceCastStatus)
  Events.addListener("finishPracticingEvent",sourceName, finishedPracticing)
end

local function unsetup(args)
  Events.removeListener("practiceCastEvent",sourceName)
  Events.removeListener("practiceCastResumeEvent",sourceName)
  Events.removeListener("practiceCastPauseEvent",sourceName)
  Events.removeListener("practiceCastOffEvent",sourceName)
  Events.removeListener("practiceCastStatusEvent",sourceName)
  Events.removeListener("finishPracticingEvent",sourceName)
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
