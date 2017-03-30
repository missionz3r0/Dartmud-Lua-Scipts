local Inscribing = {}

sourceName = "inscribing"

local practiceWriteMemory = {}
local currentSpell = ""
local currentPower = 100

local function inscribe(args)
  send("inscribe "..currentSpell.. " @ "..currentPower)
end

local function invoke(args)
  send("invoke "..currentSpell.." !")
  raiseEvent("blockEvent", {})
end

local function inscribeSetup(args)
  local spell = args["spell"]
  local power = args["power"]

  currentSpell = spell
  currentPower = power

  practiceWriteMemory[currentSpell] = {}
  practiceWriteMemory[currentSpell].power = currentPower

  cecho("<yellow>Inscribing "..currentSpell.." @ "..currentPower.."\n")
  Events.addListener("BEBTconcEvent", sourceName, inscribe)
  Events.addListener("finishedInscriptionEvent",sourceName,invoke)
  send("conc")

  Inscribing.save()
end

local function inscribeOff(args)
  Events.removeListener("BEBTconcEvent",sourceName)
  Events.removeListener("finishedInscriptionEvent",sourceName)
  cecho("<yellow>Stopped inscribing\n")
end

local function inscribeResume(args)
  local spellName = args["spellName"]

  if spellName == "" and currentSpell ~= "" then

    Events.addListener("BEBTconcEvent", sourceName, inscribe)
    cecho("<yellow>Inscribing "..currentSpell.." @ "..currentPower.."\n")
    send("conc")

  elseif practiceWriteMemory[currentSpell] then
    currentSpell = spellName
    currentPower = practiceWriteMemory[currentSpell].power

    Events.addListener("BEBTconcEvent", sourceName, channel)
    cecho("<yellow>Inscribing "..currentSpell.." @ "..currentPower.."\n")
    send("conc")
  end

  Inscribing.save()
end

local function adjustPower(args)
  local power = args["power"]

  currentPower = power
  cecho("<yellow>Inscribing "..currentSpell.." @ "..currentPower.."\n")

  Inscribing.save()
end

local function inscribeStatus(args)
  local spellName = args["spellName"]

  if spellName == "" and currentSpell ~= "" then
    cecho("<yellow>Status: Inscribing "..currentSpell.." @ "..currentPower.."\n")
  elseif practiceWriteMemory[spellName] then
    local power = practiceWriteMemory[spellName].power

    cecho("<yellow>Status: Inscribed "..spellName.." @ "..power.."\n")
  end
end

local function loaderFunction(sentTable)
  if sentTable then
    currentSpell = sentTable["currentSpell"] or ""
    currentPower = sentTable["currentPower"] or 100
    practiceWriteMemory = sentTable["practiceWriteMemory"] or {}
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
                        practiceWriteMemory = practiceWriteMemory
                        ,currentSpell = currentSpell
                        ,currentPower = currentPower
                      }
                    })
end

local function setup(args)
  Events.addListener("practiceInscribingEvent", sourceName, inscribeSetup)
  Events.addListener("practiceInscribingOffEvent", sourceName, inscribeOff)
  Events.addListener("practiceInscribingResumeEvent", sourceName, inscribeResume)
  Events.addListener("practiceInscribingAdjustPowerEvent", sourceName, adjustPower)
  Events.addListener("practiceInscribingStatusEvent", sourceName, inscribeStatus)
end

local function unsetup(args)
  Events.removeListener("practiceInscribingEvent", sourceName)
  Events.removeListener("practiceInscribingOffEvent", sourceName)
  Events.removeListener("practiceInscribingResumeEvent", sourceName)
  Events.removeListener("practiceInscribingAdjustPowerEvent", sourceName)
  Events.removeListener("practiceInscribingStatusEvent", sourceName)
end

local function resetup(args)
  unsetup(args)
  setup(args)
end

Inscribing = {
  setup = setup
  ,unsetup = unsetup
  ,resetup = resetup
  ,load = load
  ,save = save
}

return Inscribing
