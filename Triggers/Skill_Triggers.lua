local Skill_Triggers = {}

local triggers = {}

local function setup(args)
  local tempTriggers = {}

  --Skill Improvement for self
  tempTriggers.SkillImproveSelf =
  tempRegexTrigger("^(?:> )?\\* You think your ([\\w'\\-# ]+) skill has improved\\. \\*$"
   ,[[
      local name = Status.name
      local skill = matches[2]
      arguments = {name = name, skill_name = skill}

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

  --Show skill
  tempTriggers.shownSkill =
    tempRegexTrigger("^(?:> )?([A-Za-z'\\-_# ]+):\\s+([A-Za-z ]+)\\."
                    ,[[
                      local skill_name = string.lower(matches[2])
                      local skill_level = string.lower(matches[3])

                      local isStupidOoc = string.find(matches[1], "(ooc)")
                      local _s, spaces = string.gsub(skill_name, " ", " ")
                      spaces = spaces or 0
                      -- collection of possible false triggers due to the common pattern used in show skills output
                      -- if there is more than 1 space its a false positive
                      if skill_name == "concentration" or
                          skill_name == "encumbrance" or
                          skill_name == "held" or
                          skill_name == "worn" or
                          spaces > 1 or
                          not isStupidOoc == nil then
                              return
                      end

                      args = {skill_name = skill_name, skill_level = skill_level}
                      Events.raiseEvent("shownSkillEvent", args)
                    ]])
end

local function unsetup(args)
  for i,v in pairs(triggers) do
    killTrigger(v)
  end
  triggers = {}
end

local function resetup(args)
  setup(args)
  resetup(args)
end

Skill_Triggers = {
  setup = setup
  ,unsetup = unsetup
  ,resetup = resetup
}

return Skill_Triggers
