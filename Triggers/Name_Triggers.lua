local Name = {}

local triggers = {}

local function setup(args)
  local tempTriggers = {}

  tempTriggers.Name =
    tempRegexTrigger("^(?:> )?You are (\\w+) the (?:\\w+)?(?: \\(.*\\))?\\.  You are a (?:[\\s\\S]+)\\."
                     ,[[
                        local name = matches[2]
                        arguments = {name = name}

                        Events.raiseEvent("nameEvent", arguments)
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
  setup(args)
  resetup(args)
end

Name = {
  setup = setup
  ,unsetup = unsetup
  ,resetup = resetup
}

return Name
