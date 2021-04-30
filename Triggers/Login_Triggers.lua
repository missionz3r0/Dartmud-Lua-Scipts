local Login = {}

local triggers = {}

local function setup(args)
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

Login = {
  setup = setup
  ,unsetup = unsetup
  ,resetup = resetup
}

return Login
