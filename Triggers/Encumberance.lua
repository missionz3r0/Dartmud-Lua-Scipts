local Encumberance = {}

local triggers = {}

local function load()
  local tempTriggers = {}
  
  tempTriggers.Encumbrance =
    tempRegexTrigger("^(?:> )?Encumbrance: ([\s\S+]))\\."
                     ,[[
                        local encumbrance = matches[2]
                        raiseEvent("encumbranceEvent", encumbrance)
                      ]])

  triggers = tempTriggers
end

local function unload()
  for i,v in pairs(triggers) do
    killTrigger(v)
  end
end

local function reload()
  load()
  reload()
end

Encumberance = {
  load = load
  ,unload = unload
  ,reload = reload
}

return Encumberance
