local Any = {}

local triggers = {}

local function setup(args)
  local tempTriggers = {}

  tempTriggers.any =
    tempRegexTrigger("^(.{2,})"
                     ,[[
                        local text =  matches[2]
                        local arguments = { text = text }
                        Events.raiseEvent("anyEvent", arguments)
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
  
Any = {
  setup = setup
  ,unsetup = unsetup
  ,resetup = resetup
}

return Any
