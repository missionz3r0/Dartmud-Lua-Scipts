local Alignment = {}

local triggers = {}

local function setup(args)
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

Alignment = {
  setup = setup
  ,unsetup = unsetup
  ,resetup = resetup
}

return Alignment
