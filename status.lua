Status = {}
local triggers = {}

--[[
  Name: load

  Creates all the triggers that deal with a character's status.
  Each trigger raises a specific event for that concentration/aura/whatever
  As well as a general event for that class of trigger.

  For example: If the character becomes a bit off balance, then an event
  will signal anything listening for the BOBconcEvent. However
  another event will also signal that your concentration has changed.

  This is verbose, but gives us a bit more flexibility when designing
  listeners.
--]]
local function load()
  cecho("<red>Creating Status triggers")
  local tempTriggers = {}

  --Name & youthfulness
  tempTriggers.NameYouthfullness =
    tempRegexTrigger("^(?:> )?You are (\\w+) the (?:\\w+)?\\.  You are a ([\\s\\S]+)\\."
                     ,[[
                        local name = matches[2]
                        local youthfullness = matches[3]
                        raiseEvent("nameEvent", name)
                        raiseEvent("youthfullnessEvent", youthfullness)
                      ]])
  --Soul's Age
  tempTriggers.SoulAge =
    tempRegexTrigger("^(?:> )?Your soul's age is: (\\d+) years, (\\d+) months by the Common Reckoning"
                     ,[[
                        local years = matches[2]
                        local months = matches[3]
                        raiseEvent("ageEvent", years, months)
                      ]])

  --Hunger & Thirst, doesn't raise hunger specific events because
  --I can't think of a time when you want a hunger/thirst specific event.

  tempTriggers.HungerAndThirst=
    tempRegexTrigger("^(?:> )?You are ([\s\S]+), and ([\s\S]+)\\."
                     ,[[
                        local hunger = matches[2]
                        local thirst = matches[3]
                        raiseEvent("hungerEvent", hunger)
                        raiseEvent("thirstEvent", thirst)
                      ]])


  tempTriggers.NotHungry =
    tempRegexTrigger("^(?:> )?You are (not hungry)\\."
                     ,[[
                        local hunger = matches[2]
                        raiseEvent("hungerEvent", hunger)
                      ]])

  tempTriggers.SlightlyHungry =
    tempRegexTrigger("^(?:> )?You are (slightly hungry)\\."
                     ,[[
                        local hunger = matches[2]
                        raiseEvent("hungerEvent", hunger)
                      ]])

  tempTriggers.Hungry =
    tempRegexTrigger("^(?:> )?You are (hungry)\\."
                     ,[[
                        local hunger = matches[2]
                        raiseEvent("hungerEvent", hunger)
                      ]])

  tempTriggers.Famished =
    tempRegexTrigger("^(?:> )?You are (famished)\\."
                     ,[[
                        local hunger = matches[2]
                        raiseEvent("hungerEvent", hunger)
                      ]])

  tempTriggers.FaintFromHunger =
    tempRegexTrigger("^(?:> )?You are (faint from hunger)\\."
                     ,[[
                        local hunger = matches[2]
                        raiseEvent("hungerEvent", hunger)
                      ]])

  tempTriggers.Starving =
    tempRegexTrigger("^(?:> )?You are (starving)\\."
                     ,[[
                        local hunger = matches[2]
                        raiseEvent("hungerEvent", hunger)
                      ]])

  tempTriggers.NotThirsty =
    tempRegexTrigger("^(?:> )?You are (not thirsty)\\."
                     ,[[
                        local thirst = matches[2]
                        raiseEvent("thirstEvent", thirst)
                      ]])

  tempTriggers.SlightlyThirsty =
    tempRegexTrigger("^(?:> )?You are (slightly thirsty)\\."
                     ,[[
                        local thirst = matches[2]
                        raiseEvent("thirstEvent", thirst)
                      ]])

  tempTriggers.Thirsty =
    tempRegexTrigger("^(?:> )?You are (thirsty)\\."
                     ,[[
                        local thirst = matches[2]
                        raiseEvent("thirstEvent", thirst)
                      ]])

  tempTriggers.Parched =
    tempRegexTrigger("^(?:> )?You are (parched)\\."
                     ,[[
                        local thirst = matches[2]
                        raiseEvent("thirstEvent", thirst)
                      ]])

  tempTriggers.FaintFromThirst =
    tempRegexTrigger("^(?:> )?You are (faint from thirst)\\."
                     ,[[
                        local thirst = matches[2]
                        raiseEvent("thirstEvent", thirst)
                      ]])

  tempTriggers.CompletelyDehydrated =
    tempRegexTrigger("^(?:> )?You are (completely dehydrated)\\."
                     ,[[
                        local thirst = matches[2]
                        raiseEvent("thirstEvent", thirst)
                      ]])

  tempTriggers.DyingOfThirst =
    tempRegexTrigger("^(?:> )?You are (dying of thirst)\\."
                     ,[[
                        local thirst = matches[2]
                        raiseEvent("thirstEvent", thirst)
                      ]])

  --Encumberance, this isn't set up like conc or aura because I
  --can't think of an instance of where you want to trigger something
  --off of a specfic encumberance.
  tempTriggers.Encumbrance =
    tempRegexTrigger("^(?:> )?Encumbrance: ([\s\S+]))\\."
                     ,[[
                        local encumbrance = matches[2]
                        raiseEvent("encumbranceEvent", encumbrance)
                      ]])

  --Concentration triggers
  tempTriggers.BEBT =
    tempRegexTrigger("^(?:> )?(?:Concentration: )?(You're bright-eyed and bushy-tailed\\.)"
                     ,[[
                        local conc = matches[2]
                        raiseEvent("BEBTconcEvent", conc)
                        raiseEvent("concEvent", conc)
                      ]])
  tempTriggers.BOB =
    tempRegexTrigger("^(?:> )?(You're a bit off balance\\.)"
                     ,[[
                        local conc = matches[2]
                        raiseEvent("BOBconcEvent", conc)
                        raiseEvent("concEvent", conc)
                      ]])
  tempTriggers.SD =
    tempRegexTrigger("^(?:> )?(You're somewhat distracted\\.)"
                     ,[[
                        local conc = matches[2]
                        raiseEvent("SDconcEvent", conc)
                        raiseEvent("concEvent", conc)
                      ]])
  tempTriggers.OB =
    tempRegexTrigger("^(?:> )?(You're off balance\\.)"
                     ,[[
                        local conc = matches[2]
                        raiseEvent("OBconcEvent", conc)
                        raiseEvent("concEvent", conc)
                      ]])
  tempTriggers.DAOB =
    tempRegexTrigger("^(?:> )?(You're distracted and off balance\\.)"
                     ,[[
                        local conc = matches[2]
                        raiseEvent("DAOBconcEvent", conc)
                        raiseEvent("concEvent", conc)
                      ]])
  tempTriggers.SHOT =
    tempRegexTrigger("^(?:> )?(Your concentration is shot to hell\\.)"
                     ,[[
                        local conc = matches[2]
                        raiseEvent("SHOTconcEvent", conc)
                        raiseEvent("concEvent", conc)
                      ]])
  tempTriggers.TCTRN =
    tempRegexTrigger("^(?:> )?(You're too confused to remember your name\\.)"
                     ,[[
                        local conc = matches[2]
                        raiseEvent("TCTRNconcEvent", conc)
                        raiseEvent("concEvent", conc)
                      ]])
  tempTriggers.Unconscious =
    tempRegexTrigger("^(?:> )?(You fall unconscious!)"
                     ,[[
                        local conc = matches[2]
                        raiseEvent("UnconsciousEvent", conc)
                        raiseEvent("concEvent", conc)
                      ]])

  --Movement
  --This is another one where I don't really think there is a need to have
  --specific movement events.

  --Don't have them all yet.

  tempTriggers.MovementHyperBypass =
    tempRegexTrigger("^(?:> )?(?:Movement: )?(Who needs a hyperspacial bypass\\?)"
                     ,[[
                        local movement = matches[2]
                        raiseEvent("movementEvent", movement)
                      ]])

  tempTriggers.MovementTeleport =
    tempRegexTrigger("^(?:> )?(?:Movement: )?(Who needs a teleport spell\\?)"
                     ,[[
                        local movement = matches[2]
                        raiseEvent("movementEvent", movement)
                      ]])

  tempTriggers.MovementHorse =
    tempRegexTrigger("^(?:> )?(?:Movement: )?(Who needs a horse\\?)"
                     ,[[
                        local movement = matches[2]
                        raiseEvent("movementEvent", movement)
                      ]])

  --Aura Triggers
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

  --Alignment
  tempTriggers.Alignment =
    tempRegexTrigger("^(?:> )?You (\\w+) believe in (\\w+)\\."
                     ,[[
                        local conviction = matches[2]
                        local alignment = matches[3]
                        raiseEvent("alignmentEvent", conviction, alignment)
                      ]])

  --Skill Improvement for self
  tempTriggers.SkillImproveSelf =
    tempRegexTrigger("^(?:> )?\\* You think your ([\\w'\\-# ]+) skill has improved\\. \\*$"
                     ,[[
                        local skill = matches[2]
                        raiseEvent("skillImproveEvent", "dm.name", skill)
                      ]])

  --Skill Improvement for others
  tempTriggers.SkillImproveOther =
    tempRegexTrigger("^(?:> )?\\* You think that ([A-Za-z]+)'s ([\\w'\\-# ]+) skill has improved\\. \\*$"
                     ,[[
                        local who = matches[2]
                        local skill = matches[3]
                        raiseEvent("skillImproveEvent", who, skill)
                      ]])

  --Skill Improvement for others
  tempTriggers.SkillMistake =
    tempRegexTrigger("^(?:> )?\\(But you were mistaken.\\)\\."
                     ,[[
                        local who = matches[2]
                        local skill = matches[3]
                        raiseEvent("skillMistakeEvent", who, skill)
                      ]])


  triggers = tempTriggers
end

local function unload()
  cecho("<red>Killing Status triggers")
  for i,v in ipairs(triggers) do
    killTrigger(v)
  end
end

local function reload()
  cecho("<red>Starting Status Reload")
  unload()
  load()
end

Status = {
  load = load,
  unload = unload,
  reload = reload
}

return Status
