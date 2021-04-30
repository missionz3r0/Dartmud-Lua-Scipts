local Encumberance = {}

local triggers = {}

local function setup(args)
  local tempTriggers = {}

  tempTriggers.Encumbrance =
    tempRegexTrigger("^(?:> )?Encumbrance: (.+)"
                     ,[[
                        local encumbrance = matches[2]
                        local arguments = {encumbrance = encumbrance}

                        Events.raiseEvent("encumbranceEvent", arguments)
                      ]])

  triggers = tempTriggers
end

local function unsetup(args)
  for i,v in pairs(triggers) do
    killTrigger(v)
  end
  triggers = {}
end

local function resetup(args)
  unsetup(args)
  setup(args)
end

Encumberance = {
  setup = setup
  ,unsetup = unsetup
  ,resetup = resetup
}

return Encumberance
