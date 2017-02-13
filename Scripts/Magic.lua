local Magic

local practiceCastMemory = {}
local practiceWriteMemory = {}
local channelMemory = {}

local currentSpellPractice = ''
local currentSpellPower = 100
local currentSpellArguments = ''

local currentChannelPower = 1
local currentChannelTarget = ''

local

local function practiceCast(conc)
  send("cast "..currentSpellPractice.." @ ".. currentSpellPower.. " "..currentSpellArguments)
end

local function practiceCastSetup(spell, power, arguments)
  if spellName == "off" then
    Handlers.removeBEBTconcEventListener("practiceCast")

  elseif spellName == "resume" then
    Handlers.addBEBTconcEventListener("practiceCast", practiceCast)

  elseif action == "info" or "status" then
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

local function channel()
end

local function channellingSetup(power, target)

end

local function load()
  Handlers.addpracticeCastEventListener("practiceCastSetup") = practiceCastSetup
  Handlers.addchannellingEventListener("channellingSetup") = channellingSetup
end

local function unload()
  Handlers.removepracticeCastEventListener("practiceCastSetup") = practiceCastSetup
  Handlers.addchannellingEventListener("channellingSetup") = channellingSetup
end

local function reload()
  unload()
  load()
end

return Magic
