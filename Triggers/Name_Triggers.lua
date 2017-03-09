local Name = {}

local triggers = {}

local function load(args)
  local tempTriggers = {}

  tempTriggers.Name =
    tempRegexTrigger("^(?:> )?You are (\\w+) the (?:\\w+)?\\.  You are a (?:[\\s\\S]+)\\."
                     ,[[
                        local name = matches[2]
                        arguments = {name = name}

                        Events.raiseEvent("nameEvent", arguments)
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

Name = {
  load = load
  ,unload = unload
  ,reload = reload
}

return Name
