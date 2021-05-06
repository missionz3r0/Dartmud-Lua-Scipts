local Skill_Triggers = {}

local triggers = {}

local function setup(args)
  local tempTriggers = {}

  --Skill Improvement for self
  tempTriggers.SkillImproveSelf =
  tempRegexTrigger("^(?:> )?\\* You think your ([\\w'\\-# ]+) skill has improved\\. \\*$"
   ,[[
      local name = Status.name
      local skill_name = matches[2]
      arguments = {name = name, skill_name = skill_name}

      Events.raiseEvent("skillImproveEvent", arguments)
    ]])

  --Skill Improvement for others
  tempTriggers.SkillImproveOther =
  tempRegexTrigger("^(?:> )?\\* You think that ([A-Za-z]+)'s ([\\w'\\-# ]+) skill has improved\\. \\*$"
   ,[[
      local name = matches[2]
      local skill_name = matches[3]
      arguments = {name = name, skill_name = skill_name}

      Events.raiseEvent("skillImproveEvent", arguments)
    ]])

  --Skill Improvement mistake
  tempTriggers.SkillMistake =
  tempRegexTrigger("^(?:> )?\\(But you were mistaken.\\)"
   ,[[
      arguments = {}

      Events.raiseEvent("skillMistakeEvent", arguments)
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

Skill_Triggers = {
  setup = setup
  ,unsetup = unsetup
  ,resetup = resetup
}

return Skill_Triggers
