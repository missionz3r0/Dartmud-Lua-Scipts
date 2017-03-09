local Alignment = {}

local triggers = {}

local function load()
  local tempTriggers = {}

  tempTriggers.Alignment =
    tempRegexTrigger("^(?:> )?You (\\w+) believe in (\\w+)\\."
                     ,[[
                        local conviction = matches[2]
                        local alignment = matches[3]
                        local arguments  = {conviction = conviction
                                            ,alignment = alignment}

                        Events.raiseEvent("alignmentEvent", arguments)
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

Alignment = {
  load = load
  ,unload = unload
  ,reload = reload
}

return Alignment
