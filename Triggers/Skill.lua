local Skill = {}

local triggers = {}

local function load()
  local tempTriggers = {}

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

  --Skill Improvement mistake
  tempTriggers.SkillMistake =
  tempRegexTrigger("^(?:> )?\\(But you were mistaken.\\)\\."
   ,[[
      raiseEvent("skillMistakeEvent")
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

Skill = {
  load = load
  ,unload = unload
  ,reload = reload
}

return Skill
