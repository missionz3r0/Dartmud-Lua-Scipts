local Login = {}

local triggers = {}

local function load(args)
  local tempTriggers = {}

  tempTriggers.login =
    tempRegexTrigger("^Running under version \\S+\\."
                     ,[[
                        arguments = {}
                        Events.raiseEvent("loginEvent", arguments)
                      ]])

  tempTriggers.re_login =
    tempRegexTrigger("^You are already playing, reconnecting to old object."
                     ,[[
                        arguments = {}
                        Events.raiseEvent("loginEvent", arguments)
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

Login = {
  load = load
  ,unload = unload
  ,reload = reload
}

return Login
