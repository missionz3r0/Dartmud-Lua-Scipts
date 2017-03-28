local Who_Triggers = {}

local triggers = {}

local function load(args)
  local tempTriggers = {}

  tempTriggers.whoTitle =
    tempRegexTrigger("^(?:> )?(?: *Name +Idle(?: Time)?)+"
               ,[[
                  args = {}
                  Events.raiseEvent("startWhoEvent", args)
                ]])

  tempTriggers.whoNames =
    tempRegexTrigger("^(?:> )?(?: {7}| {2}(?:\\[[A-Za-z]+\\] ))(?:([A-Za-z]+ [A-Za-z]+ [A-Za-z]+)( +)(?:\\d+m)? ?(?:\\d+s)?)+ *?"
               ,[[
                  args = {name = name}
                  Events.raiseEvent("whoEvent", args)
                ]])

  tempTriggers.playersOnline =
    tempRegexTrigger("^(?:> )?[\\w ]+ \\d+ (?:(?:players)|(?:people))(?: on\\. |, but) [Oo]nly \\d+ [\\w, ]+\\."
               ,[[
                  args = {}
                  Events.raiseEvent("whoEvent", args)
                ]])


  tempTriggers.whoWhere =
    tempRegexTrigger("^(?:> )? *Most people seem to be in (?:\\w+) right now\."
                ,[[
                  args = {}
                  Events.raiseEvent("whoEvent", args)
                ]])

  tempTriggers.activePlayers =
    tempRegexTrigger("^(?:> )? *Estimated active characters: \\d+ this month, \\d+ today."
               ,[[
                  args = {}
                  Events.raiseEvent("whoEvent", args)
                ]])

  tempTriggers.endWho =
    tempRegexTrigger("^(?:> )? *Ferdarchi was last renewed (?:\\d+ days )?(?:\\d+ hours )?(?:\\d+ minutes )?(?:\\d+ seconds)? ago\\."
               ,[[
                 args = {}
                 Events.raiseEvent("endWhoEvent", args)
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

Who_Triggers = {
  load = load
  ,unload = unload
  ,reload = reload
}

return Who_Triggers
