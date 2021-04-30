local Name = {}

local triggers = {}

local function setup(args)
  local tempTriggers = {}

  tempTriggers.Name =
    tempRegexTrigger("^(?:> )?You are (?:[A-Za-z]* )?(\\w+) the (?:\\w+)?(?: \\(.*\\))?\\.  You are (?:a|an) (?:[\\s\\S]+)\\."
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
  unsetup(args)
  setup(args)
end

Name = {
  setup = setup
  ,unsetup = unsetup
  ,resetup = resetup
}

return Name
