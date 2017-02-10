local Concentration = {}

local triggers = {}

local function load()
  local tempTriggers = {}

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

Concentration = {
  load = load
  ,unload = unload
  ,reload = reload
}

return Concentration
