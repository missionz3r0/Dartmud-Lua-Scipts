local Alignment = {}

local triggers = {}

local function load(args)
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

Alignment = {
  load = load
  ,unload = unload
  ,reload = reload
}

return Alignment
