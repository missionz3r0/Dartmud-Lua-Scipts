local Alignment = {}

local triggers = {}

local function load()
  local tempTriggers = {}
  
  tempTriggers.Alignment =
    tempRegexTrigger("^(?:> )?You (\\w+) believe in (\\w+)\\."
                     ,[[
                        local conviction = matches[2]
                        local alignment = matches[3]
                        raiseEvent("alignmentEvent", conviction, alignment)
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

Alignment = {
  load = load
  ,unload = unload
  ,reload = reload
}

return Alignment
