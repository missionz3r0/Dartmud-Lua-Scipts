--Aura
local Aura = {}

local triggers = {}

local function load()
  local tempTriggers = {}

  tempTriggers.VeryDimRed =
    tempRegexTrigger("^(?:> )?Your aura appears to be (very dim red)\\."
                     ,[[
                        local aura = matches[2]
                        raiseEvent("VeryDimRedauraEvent", aura)
                        raiseEvent("auraEvent", aura)
                      ]])

  tempTriggers.DimRed =
    tempRegexTrigger("^(?:> )?Your aura appears to be (dim red)\\."
                     ,[[
                        local aura = matches[2]
                        raiseEvent("DimRedauraEvent", aura)
                        raiseEvent("auraEvent", aura)
                      ]])

  tempTriggers.Red =
    tempRegexTrigger("^(?:> )?Your aura appears to be (red)\\."
                     ,[[
                        local aura = matches[2]
                        raiseEvent("RedauraEvent", aura)
                        raiseEvent("auraEvent", aura)
                      ]])

  tempTriggers.OrangishRed =
    tempRegexTrigger("^(?:> )?Your aura appears to be (orangish-red)\\."
                     ,[[
                        local aura = matches[2]
                        raiseEvent("OrangishRedauraEvent", aura)
                        raiseEvent("auraEvent", aura)
                      ]])

  tempTriggers.ReddishOrange =
    tempRegexTrigger("^(?:> )?Your aura appears to be (reddish-orange)\\."
                     ,[[
                        local aura = matches[2]
                        raiseEvent("ReddishOrangeauraEvent", aura)
                        raiseEvent("auraEvent", aura)
                      ]])

  tempTriggers.Orange =
    tempRegexTrigger("^(?:> )?Your aura appears to be (orange)\\."
                     ,[[
                        local aura = matches[2]
                        raiseEvent("OrangeauraEvent", aura)
                        raiseEvent("auraEvent", aura)
                      ]])

  tempTriggers.YellowishOrange =
    tempRegexTrigger("^(?:> )?Your aura appears to be (yellowish-orange)\\."
                     ,[[
                        local aura = matches[2]
                        raiseEvent("YellowishOrangeauraEvent", aura)
                        raiseEvent("auraEvent", aura)
                      ]])

  tempTriggers.OrangishYellow =
    tempRegexTrigger("^(?:> )?Your aura appears to be (orangish-yellow)\\."
                     ,[[
                        local aura = matches[2]
                        raiseEvent("OrangishYellowauraEvent", aura)
                        raiseEvent("auraEvent", aura)
                      ]])

  tempTriggers.Yellow =
    tempRegexTrigger("^(?:> )?Your aura appears to be (yellow)\\."
                     ,[[
                        local aura = matches[2]
                        raiseEvent("YellowauraEvent", aura)
                        raiseEvent("auraEvent", aura)
                      ]])

  tempTriggers.GreenishYellow =
    tempRegexTrigger("^(?:> )?Your aura appears to be (greenish-yellow)\\."
                     ,[[
                        local aura = matches[2]
                        raiseEvent("GreenishYellowauraEvent", aura)
                        raiseEvent("auraEvent", aura)
                      ]])

  tempTriggers.YellowishGreen =
    tempRegexTrigger("^(?:> )?Your aura appears to be (yellowish-green)\\."
                     ,[[
                        local aura = matches[2]
                        raiseEvent("YellowishGreenauraEvent", aura)
                        raiseEvent("auraEvent", aura)
                      ]])

  tempTriggers.Green =
    tempRegexTrigger("^(?:> )?Your aura appears to be (green)\\."
                     ,[[
                        local aura = matches[2]
                        raiseEvent("GreenauraEvent", aura)
                        raiseEvent("auraEvent", aura)
                      ]])

  tempTriggers.BluishGreen =
    tempRegexTrigger("^(?:> )?Your aura appears to be (bluish-green)\\."
                     ,[[
                        local aura = matches[2]
                        raiseEvent("BluishGreenauraEvent", aura)
                        raiseEvent("auraEvent", aura)
                      ]])

  tempTriggers.GreenishBlue =
    tempRegexTrigger("^(?:> )?Your aura appears to be (greenish-blue)\\."
                     ,[[
                        local aura = matches[2]
                        raiseEvent("GreenishBlueauraEvent", aura)
                        raiseEvent("auraEvent", aura)
                      ]])

  tempTriggers.Blue =
    tempRegexTrigger("^(?:> )?Your aura appears to be (blue)\\."
                     ,[[
                        local aura = matches[2]
                        raiseEvent("BlueauraEvent", aura)
                        raiseEvent("auraEvent", aura)
                      ]])

  tempTriggers.IntenseBlue =
    tempRegexTrigger("^(?:> )?Your aura appears to be (intense blue)\\."
                     ,[[
                        local aura = matches[2]
                        raiseEvent("IntenseBlueauraEvent", aura)
                        raiseEvent("auraEvent", aura)
                      ]])

  tempTriggers.DimIndigo =
    tempRegexTrigger("^(?:> )?Your aura appears to be (dim indigo)\\."
                     ,[[
                        local aura = matches[2]
                        raiseEvent("DimIndigoauraEvent", aura)
                        raiseEvent("auraEvent", aura)
                      ]])

  tempTriggers.Indigo =
    tempRegexTrigger("^(?:> )?Your aura appears to be (indigo)\\."
                     ,[[
                        local aura = matches[2]
                        raiseEvent("IndigoauraEvent", aura)
                        raiseEvent("auraEvent", aura)
                      ]])

  tempTriggers.IntenseIndigo =
    tempRegexTrigger("^(?:> )?Your aura appears to be (intense indigo)\\."
                     ,[[
                        local aura = matches[2]
                        raiseEvent("IntenseIndigoauraEvent", aura)
                        raiseEvent("auraEvent", aura)
                      ]])

  tempTriggers.DimViolet =
    tempRegexTrigger("^(?:> )?Your aura appears to be (dim violet)\\."
                     ,[[
                        local aura = matches[2]
                        raiseEvent("DimVioletauraEvent", aura)
                        raiseEvent("auraEvent", aura)
                      ]])

  tempTriggers.Violet =
    tempRegexTrigger("^(?:> )?Your aura appears to be (violet)\\."
                     ,[[
                        local aura = matches[2]
                        raiseEvent("VioletauraEvent", aura)
                        raiseEvent("auraEvent", aura)
                      ]])

  tempTriggers.IntenseViolet =
    tempRegexTrigger("^(?:> )?Your aura appears to be (intense violet)\\."
                     ,[[
                        local aura = matches[2]
                        raiseEvent("IntenseVioletauraEvent", aura)
                        raiseEvent("auraEvent", aura)
                      ]])

  tempTriggers.DimOctarine =
    tempRegexTrigger("^(?:> )?Your aura appears to be (dim octarine)\\."
                     ,[[
                        local aura = matches[2]
                        raiseEvent("DimOctarineauraEvent", aura)
                        raiseEvent("auraEvent", aura)
                      ]])

  tempTriggers.Octarine =
    tempRegexTrigger("^(?:> )?Your aura appears to be (octarine)\\."
                     ,[[
                        local aura = matches[2]
                        raiseEvent("OctarineauraEvent", aura)
                        raiseEvent("auraEvent", aura)
                      ]])

  tempTriggers.IntenseOctarine =
    tempRegexTrigger("^(?:> )?Your aura appears to be (intense octarine)\\."
                     ,[[
                        local aura = matches[2]
                        raiseEvent("IntenseOctarineauraEvent", aura)
                        raiseEvent("auraEvent", aura)
                      ]])

  tempTriggers.Scintilating =
    tempRegexTrigger("^(?:> )?Your aura appears to be (scintilating)\\."
                     ,[[
                        local aura = matches[2]
                        raiseEvent("ScintilatingauraEvent", aura)
                        raiseEvent("auraEvent", aura)
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

Aura = {
  load = load
  ,unload = unload
  ,reload = reload
}

return Aura
