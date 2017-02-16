local Skill = {}

local function load()
  --Add update skill Alias

  --Add Skill info Alias
  	tempAliases = {}
  	tempAliases.SkillInfo = tempAlias('^\\/info(?: )?(.*)',
  																				[[
  																					local skill_name = matches[2]
  																					raiseEvent('skillInfoEvent',skill)
  																				]])

    aliases = tempAliases

  --Add announcer alias
end

local function unload()
end

local function reload()
  unload()
  reload()
end

Skill =
{
  load = load
  ,unload = unload
  ,reload = reload
}

return Skill
