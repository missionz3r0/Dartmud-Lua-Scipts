local Skill = {}
local aliases = {}

local function load(args)
  tempAliases = {}
  --Add update skill Alias

  --Add Skill info Alias
  	tempAliases.SkillInfo =
      tempAlias('^\\/info(?: )?(.*)',
								[[
									local skill_name = matches[2]
                  local arguments = {skill_name = skill_name, who = Status.name}
									Events.raiseEvent('skillInfoEvent', arguments)
								]])

    aliases = tempAliases

  --Add announcer alias
end

local function unload(args)
  for i,v in pairs(aliases) do
    killAlias(v)
  end
end

local function reload(args)
  unload(args)
  load(args)
end

Skill =
{
  load = load
  ,unload = unload
  ,reload = reload
}

return Skill
