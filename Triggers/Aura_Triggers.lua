--Aura
local Aura = {}

local triggers = {}

local function setup(args)
  local tempTriggers = {}

  tempTriggers.VeryDimRed =
    tempRegexTrigger("^(?:> )?Your aura appears to be (very dim red)\\."
                     ,[[
                        local aura = matches[2]
                        local arguments  = {aura = aura}

                        Events.raiseEvent("VeryDimRedauraEvent", arguments)
                        Events.raiseEvent("auraEvent", arguments)
                      ]])

  tempTriggers.DimRed =
    tempRegexTrigger("^(?:> )?Your aura appears to be (dim red)\\."
                     ,[[
                        local aura = matches[2]
                        local arguments  = {aura = aura}

                        Events.raiseEvent("DimRedauraEvent", arguments)
                        Events.raiseEvent("auraEvent", arguments)
                      ]])

  tempTriggers.Red =
    tempRegexTrigger("^(?:> )?Your aura appears to be (red)\\."
                     ,[[
                        local aura = matches[2]
                        local arguments  = {aura = aura}

                        Events.raiseEvent("RedauraEvent", arguments)
                        Events.raiseEvent("auraEvent", arguments)
                      ]])

  tempTriggers.OrangishRed =
    tempRegexTrigger("^(?:> )?Your aura appears to be (orangish-red)\\."
                     ,[[
                        local aura = matches[2]
                        local arguments  = {aura = aura}

                        Events.raiseEvent("OrangishRedauraEvent", arguments)
                        Events.raiseEvent("auraEvent", arguments)
                      ]])

  tempTriggers.ReddishOrange =
    tempRegexTrigger("^(?:> )?Your aura appears to be (reddish-orange)\\."
                     ,[[
                        local aura = matches[2]
                        local arguments  = {aura = aura}

                        Events.raiseEvent("ReddishOrangeauraEvent", arguments)
                        Events.raiseEvent("auraEvent", arguments)
                      ]])

  tempTriggers.Orange =
    tempRegexTrigger("^(?:> )?Your aura appears to be (orange)\\."
                     ,[[
                        local aura = matches[2]
                        local arguments  = {aura = aura}

                        Events.raiseEvent("OrangeauraEvent", arguments)
                        Events.raiseEvent("auraEvent", arguments)
                      ]])

  tempTriggers.YellowishOrange =
    tempRegexTrigger("^(?:> )?Your aura appears to be (yellowish-orange)\\."
                     ,[[
                        local aura = matches[2]
                        local arguments  = {aura = aura}

                        Events.raiseEvent("YellowishOrangeauraEvent", arguments)
                        Events.raiseEvent("auraEvent", arguments)
                      ]])

  tempTriggers.OrangishYellow =
    tempRegexTrigger("^(?:> )?Your aura appears to be (orangish-yellow)\\."
                     ,[[
                        local aura = matches[2]
                        local arguments  = {aura = aura}

                        Events.raiseEvent("OrangishYellowauraEvent", arguments)
                        Events.raiseEvent("auraEvent", arguments)
                      ]])

  tempTriggers.Yellow =
    tempRegexTrigger("^(?:> )?Your aura appears to be (yellow)\\."
                     ,[[
                        local aura = matches[2]
                        local arguments  = {aura = aura}

                        Events.raiseEvent("YellowauraEvent", arguments)
                        Events.raiseEvent("auraEvent", arguments)
                      ]])

  tempTriggers.GreenishYellow =
    tempRegexTrigger("^(?:> )?Your aura appears to be (greenish-yellow)\\."
                     ,[[
                        local aura = matches[2]
                        local arguments  = {aura = aura}

                        Events.raiseEvent("GreenishYellowauraEvent", arguments)
                        Events.raiseEvent("auraEvent", arguments)
                      ]])

  tempTriggers.YellowishGreen =
    tempRegexTrigger("^(?:> )?Your aura appears to be (yellowish-green)\\."
                     ,[[
                        local aura = matches[2]
                        local arguments  = {aura = aura}

                        Events.raiseEvent("YellowishGreenauraEvent", arguments)
                        Events.raiseEvent("auraEvent", arguments)
                      ]])

  tempTriggers.Green =
    tempRegexTrigger("^(?:> )?Your aura appears to be (green)\\."
                     ,[[
                        local aura = matches[2]
                        local arguments  = {aura = aura}

                        Events.raiseEvent("GreenauraEvent", arguments)
                        Events.raiseEvent("auraEvent", arguments)
                      ]])

  tempTriggers.BluishGreen =
    tempRegexTrigger("^(?:> )?Your aura appears to be (bluish-green)\\."
                     ,[[
                        local aura = matches[2]
                        local arguments  = {aura = aura}

                        Events.raiseEvent("BluishGreenauraEvent", arguments)
                        Events.raiseEvent("auraEvent", arguments)
                      ]])

  tempTriggers.GreenishBlue =
    tempRegexTrigger("^(?:> )?Your aura appears to be (greenish-blue)\\."
                     ,[[
                        local aura = matches[2]
                        local arguments  = {aura = aura}

                        Events.raiseEvent("GreenishBlueauraEvent", arguments)
                        Events.raiseEvent("auraEvent", arguments)
                      ]])

  tempTriggers.Blue =
    tempRegexTrigger("^(?:> )?Your aura appears to be (blue)\\."
                     ,[[
                        local aura = matches[2]
                        local arguments  = {aura = aura}

                        Events.raiseEvent("BlueauraEvent", arguments)
                        Events.raiseEvent("auraEvent", arguments)
                      ]])

  tempTriggers.IntenseBlue =
    tempRegexTrigger("^(?:> )?Your aura appears to be (intense blue)\\."
                     ,[[
                        local aura = matches[2]
                        local arguments  = {aura = aura}

                        Events.raiseEvent("IntenseBlueauraEvent", arguments)
                        Events.raiseEvent("auraEvent", arguments)
                      ]])

  tempTriggers.DimIndigo =
    tempRegexTrigger("^(?:> )?Your aura appears to be (dim indigo)\\."
                     ,[[
                        local aura = matches[2]
                        local arguments  = {aura = aura}

                        Events.raiseEvent("DimIndigoauraEvent", arguments)
                        Events.raiseEvent("auraEvent", arguments)
                      ]])

  tempTriggers.Indigo =
    tempRegexTrigger("^(?:> )?Your aura appears to be (indigo)\\."
                     ,[[
                        local aura = matches[2]
                        local arguments  = {aura = aura}

                        Events.raiseEvent("IndigoauraEvent", arguments)
                        Events.raiseEvent("auraEvent", arguments)
                      ]])

  tempTriggers.IntenseIndigo =
    tempRegexTrigger("^(?:> )?Your aura appears to be (intense indigo)\\."
                     ,[[
                        local aura = matches[2]
                        local arguments  = {aura = aura}

                        Events.raiseEvent("IntenseIndigoauraEvent", arguments)
                        Events.raiseEvent("auraEvent", arguments)
                      ]])

  tempTriggers.DimViolet =
    tempRegexTrigger("^(?:> )?Your aura appears to be (dim violet)\\."
                     ,[[
                        local aura = matches[2]
                        local arguments  = {aura = aura}

                        Events.raiseEvent("DimVioletauraEvent", arguments)
                        Events.raiseEvent("auraEvent", arguments)
                      ]])

  tempTriggers.Violet =
    tempRegexTrigger("^(?:> )?Your aura appears to be (violet)\\."
                     ,[[
                        local aura = matches[2]
                        local arguments  = {aura = aura}

                        Events.raiseEvent("VioletauraEvent", arguments)
                        Events.raiseEvent("auraEvent", arguments)
                      ]])

  tempTriggers.IntenseViolet =
    tempRegexTrigger("^(?:> )?Your aura appears to be (intense violet)\\."
                     ,[[
                        local aura = matches[2]
                        local arguments  = {aura = aura}

                        Events.raiseEvent("IntenseVioletauraEvent", arguments)
                        Events.raiseEvent("auraEvent", arguments)
                      ]])

  tempTriggers.DimOctarine =
    tempRegexTrigger("^(?:> )?Your aura appears to be (dim octarine)\\."
                     ,[[
                        local aura = matches[2]
                        local arguments  = {aura = aura}

                        Events.raiseEvent("DimOctarineauraEvent", arguments)
                        Events.raiseEvent("auraEvent", arguments)
                      ]])

  tempTriggers.Octarine =
    tempRegexTrigger("^(?:> )?Your aura appears to be (octarine)\\."
                     ,[[
                        local aura = matches[2]
                        local arguments  = {aura = aura}

                        Events.raiseEvent("OctarineauraEvent", arguments)
                        Events.raiseEvent("auraEvent", arguments)
                      ]])

  tempTriggers.IntenseOctarine =
    tempRegexTrigger("^(?:> )?Your aura appears to be (intense octarine)\\."
                     ,[[
                        local aura = matches[2]
                        local arguments  = {aura = aura}

                        Events.raiseEvent("IntenseOctarineauraEvent", arguments)
                        Events.raiseEvent("auraEvent", arguments)
                      ]])

  tempTriggers.Scintilating =
    tempRegexTrigger("^(?:> )?Your aura appears to be (scintillating)\\."
                     ,[[
                        local aura = matches[2]
                        local arguments  = {aura = aura}

                        Events.raiseEvent("ScintillatingauraEvent", arguments)
                        Events.raiseEvent("auraEvent", arguments)
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

Aura = {
  setup = setup
  ,unsetup = unsetup
  ,resetup = resetup
}

return Aura
