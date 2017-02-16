local Casting = {}

local currentSpellPractice = ''
local currentSpellPower = 100
local currentSpellArguments = ''

local function practiceCast(conc)
  send("cast "..currentSpellPractice.." @ ".. currentSpellPower.. " "..currentSpellArguments)
end

local function practiceCastSetup(spellName, power, arguments)
  if spellName == "off" then
    Handlers.removeBEBTconcEventListener("practiceCast")

  elseif spellName == "resume" then
    Handlers.addBEBTconcEventListener("practiceCast", practiceCast)

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

    Handlers.addBEBTconcEventListener("practiceCast", practiceCast)
  end
end

local function load()
  Handlers.addpracticeCastEventListener("practiceCastSetup", practiceCastSetup)
end

local function unload()
  Handlers.removepracticeCastEventListener("practiceCastSetup", practiceCastSetup)
end

local function reload()
  unload()
  load()
end

Casting = {
  load = load
  ,unload = unload
  ,reload = reload
}

return Casting