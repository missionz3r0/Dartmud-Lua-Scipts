local Skill_Triggers = {}

local triggers = {}

local function load(args)
  local tempTriggers = {}

  --Skill Improvement for self
  tempTriggers.SkillImproveSelf =
  tempRegexTrigger("^(?:> )?\\* You think your ([\\w'\\-# ]+) skill has improved\\. \\*$"
   ,[[
      local name = Status.name
      local skill = matches[2]
      arguments = {name = name, skill = skill}

      raiseEvent("skillImproveEvent", arguments)
    ]])

  --Skill Improvement for others
  tempTriggers.SkillImproveOther =
  tempRegexTrigger("^(?:> )?\\* You think that ([A-Za-z]+)'s ([\\w'\\-# ]+) skill has improved\\. \\*$"
   ,[[
      local name = matches[2]
      local skill = matches[3]
      arguments = {name = name, skill = skill}

      Events.raiseEvent("skillImproveEvent", arguments)
    ]])

  --Skill Improvement mistake
  tempTriggers.SkillMistake =
  tempRegexTrigger("^(?:> )?\\(But you were mistaken.\\)\\."
   ,[[
      arguments = {}

      Events.raiseEvent("skillMistakeEvent", arguments)
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

Skill_Triggers = {
  load = load
  ,unload = unload
  ,reload = reload
}

return Skill_Triggers
