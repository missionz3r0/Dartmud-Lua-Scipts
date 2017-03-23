local Encumberance = {}

local triggers = {}

local function load(args)
  local tempTriggers = {}

  tempTriggers.Encumbrance =
    tempRegexTrigger("^(?:> )?Encumbrance: ([\\s\\S]+))\\."
                     ,[[
                        local encumbrance = matches[2]
                        local arguments = {encumbrance = encumbrance}

                        Events.raiseEvent("encumbranceEvent", arguments)
                      ]])

  triggers = tempTriggers
end

local function unload(args)
  for i,v in pairs(triggers) do
    killTrigger(v)
  end
  triggers = {}
end

local function reload(args)
  load(args)
  reload(args)
end

Encumberance = {
  load = load
  ,unload = unload
  ,reload = reload
}

return Encumberance
