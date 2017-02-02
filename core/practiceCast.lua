practiceCast = {}
local aliases = {}
local spell = 'lg'
local power = 100
local arguments = ''

registerAnonymousEventHandler("practiceCastingEvent", "practiceCast.practiceCastingEventHandler")

local function practiceCasting()
  send("cast ! "..spell.." @ "..power.." "..arguments)
end

local function practiceCastingEventHandler(spellArg, powerArg, argumentsArg)
  local listenerName = 'practiceCasting'

  if spellArg = 'resume' then
    handlers.addBEBTconcEventListener(listenerName,practiceCasting)
  else if spellArg = 'off' then
    handlers.removeBEBTconcEventListener(listenerName,practiceCasting)
  else
    spell = spellArg
    power = powerArg
    arguments = argumentsArg

    handlers.addBEBTconcEventListener(listenerName,practiceCasting)
  end
end

local function load()
  local tempAliases = {}

  tempAliases.startPractice = tempAlias('^\\/cast !( \\w+)(?: @ (\\d+))?([\\s\\S]+)?',
                                        [[
                                          local spell = multimatches[2]
                                          local power = multimatches[3]
                                          local arguments = multimatches[4]
                                          raiseEvent('practiceCastingEvent',spell, power, arguments)
                                        ]])

  aliases = tempAliases
end

local function unload()
  for i,v in ipairs(aliases) do
    killAlias(v)
  end
end

local function reload()
  unload()
  reload()
end

practiceCast =
{
  unload = unload,
  load = load,
  reload = reload,
  practiceCast = practiceCast
}

return practiceCast
