local Skill = {}
local aliases = {}

local function setup(args)
  tempAliases = {}
  --Add update skill Alias
  	tempAliases.updateSkill =
      tempAlias('^\\/update ([\\w]+) ([A-Za-z_\' ]+) ([\\d]+)',
								[[
									local who = matches[2]
                  local skill_name = matches[3]
                  local count = matches[4]
                  local arguments = {skill_name = skill_name, who = who, count = count}
									Events.raiseEvent('updateSkillEvent', arguments)
								]])


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

local function unsetup(args)
  for i,v in pairs(aliases) do
    killAlias(v)
  end
end

local function resetup(args)
  unsetup(args)
  setup(args)
end

Skill =
{
  setup = setup
  ,unsetup = unsetup
  ,resetup = resetup
}

return Skill
