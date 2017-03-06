local Login = {}

local triggers = {}

local function load()
  local tempTriggers = {}

  tempTriggers.Login =
    tempRegexTrigger("^Running under version (?:\S+)\."
                     ,[[
                        raiseEvent("loginEvent")
                      ]])

  triggers = tempTriggers
end

local function unload()
  for i,v in pairs(triggers) do
    killTrigger(v)
  end
  triggers = {}
end

local function reload()
  load()
  reload()
end

Login = {
  load = load
  ,unload = unload
  ,reload = reload
}

return Login
