
--Need a score parser for increaseSkill() to work. To be more specific I need to parse the output from the game's "score" command.
--Still need to implement an adjuster that will fix the skill levels if it finds them to be in error.
Skills = {}

local sourceName = 'skills'

-- build database if needed
dba.execute('CREATE TABLE IF NOT EXISTS "improves" (_row_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, skill TEXT, count INTEGER DEFAULT 1, notes TEXT, last_imp TIMESTAMP, who VARCHAR(16), abbr TEXT, weight TEXT, power INTEGER);');


local levels= {
	["unskilled"]        = {["abbr"] = "unskilled",	["min"] = "1",		["max"] = "3"},
	["a tyro"] 			     = {["abbr"] = "tyro",		  ["min"] = "4",		["max"] = "9"},
	["a novice"] 		     = {["abbr"] = "novice",		["min"] = "10",		["max"] = "17"},
	["a beginner"]       = {["abbr"] = "beginner",	["min"] = "18",		["max"] = "29"},
	["poor"] 			       = {["abbr"] = "poor",		  ["min"] = "30",		["max"] = "49"},
	["not very good"] 	 = {["abbr"] = "nvg",		    ["min"] = "50",		["max"] = "69"},
	["below average"]    = {["abbr"] = "ba",			  ["min"] = "70",		["max"] = "89"},
	["average"] 		     = {["abbr"] = "avg",		    ["min"] = "90",		["max"] = "109"},
	["above average"] 	 = {["abbr"] = "aa",		  	["min"] = "110",	["max"] = "134"},
	["able"] 			       = {["abbr"] = "able",	  	["min"] = "135",	["max"] = "164"},
	["fair"] 			       = {["abbr"] = "fair",		  ["min"] = "165",	["max"] = "199"},
	["proficient"] 		   = {["abbr"] = "prof",		  ["min"] = "200",	["max"] = "239"},
	["good"] 	           = {["abbr"] = "good",		  ["min"] = "240",	["max"] = "284"},
	["adroit"] 	   	     = {["abbr"] = "adroit",		["min"] = "285",	["max"] = "334"},
	["very good"] 		   = {["abbr"] = "vg",			  ["min"] = "335",	["max"] = "389"},
	["excellent"] 		   = {["abbr"] = "excellent",	["min"] = "390",	["max"] = "449"},
	["an expert"] 		   = {["abbr"] = "expert",		["min"] = "450",	["max"] = "514"},
	["superb"] 			   	 = {["abbr"] = "superb",		["min"] = "515",	["max"] = "584"},
	["a master"] 		     = {["abbr"] = "master",		["min"] = "585",	["max"] = "659"},
	["eminent"] 		     = {["abbr"] = "eminent",   ["min"] = "660",	["max"] = "739"},
	["an adept"] 		     = {["abbr"] = "adept",		  ["min"] = "740",	["max"] = "824"},
	["renowned"] 		     = {["abbr"] = "renowned",	["min"] = "825",	["max"] = "919"},
	["a high master"] 	 = {["abbr"] = "hm",			  ["min"] = "920",	["max"] = "1049"},
	["consummate"] 		   = {["abbr"] = "consummate",["min"] = "1050",	["max"] = "1199"},
	["a virtuoso"] 		   = {["abbr"] = "virtuoso",	["min"] = "1200",	["max"] = "1399"},
	["a grand master"] 	 = {["abbr"] = "gm",			  ["min"] = "1400",	["max"] = "1699"},
	["legendary"] 		   = {["abbr"] = "leggy",	  	["min"] = "1700",	["max"] = "99999"}
}

local function getSkill(who, skill_name)
    if not who then
        who = dm.me
    end

    local results = dba.query('SELECT * FROM improves WHERE who="'..who..'" AND skill LIKE "'..skill_name..'%"')

    if results.count() == 0 then
        return -1
    end
    if results.count() > 1 then
        local i
        cecho("<red>Too many results did you mean:\n")
        for i=1,results.count() do
            cecho("<red>\t"..results[i].skill.."\n")
        end
        return 0
    end
    return results[1]
end

local function imp2lvl(imp)
    imp = tonumber(imp)
    local results = u.reverse(u.filter(levels, function(i) return tonumber(i.min) <= imp end))
    if results then
        local name = results[1]["abbr"]
        local min = tonumber(results[1].min)

        return name
    else
        return -1
    end
end

local function nextLevel(imp)
    local results = u.filter(_dm.levels, function(i) return tonumber(i.min) > imp end)
    if results then
        return results[1]
    else
        return -1
    end
end

local function skillInfo(skill_name, who)
	local result = getSkill(skill_name, who)
	if result == -1 then
        cecho("<red>_dm.getSkill(): Invalid arguments...<reset>\n")
        return
	end

	local count = tonumber(result.count)
	local level = imp2lvl(count, "name")
	local nextLevel, tilNext
	nextLevel = nextLevel(count)
	if nextLevel ~= nil then
	    tilNext = nextLevel.min - count
	end
	local output = count.." - "..level
	if nextLevel ~= nil then
	    output = output.." - ("..tilNext.." / "..nextLevel.abbr..")"
	end
	cecho("<yellow>Information for: "..result.skill.."\n")
	cecho("<yellow>Improves: "..output.."\n")
end

local function increaseSkill(skill_name, who)
	if not who then
		who = dm.me
	end

	local results = dba.query('SELECT * FROM improves WHERE who="'..who..'" AND skill="'..skill_name..'"')[1]
	local count = 1

	if results then
		results.count = tonumber(results.count) + 1
		count = results.count
		dba.execute('UPDATE improves SET count='..count..' WHERE who="'..who..'" AND skill="'..skill_name..'"')
		dba.execute('UPDATE improves SET last_imp=datetime("NOW") WHERE who="'..who..'" AND skill="'..skill_name..'"')
	else
		dba.execute('INSERT INTO improves (skill, count, who, last_imp) VALUES("'..skill_name..'", 1, "'..who..'", datetime("NOW"))')
	end
	return count
end

local function load()
  Handlers.addSkillImproveListener(sourceName,increaseSkill)
  Handlers.addSkillInfoListener(sourceName, skillInfo)
end

local function unload()
  Handlers.removeSkillImproveListener(sourceName)
  Handlers.removeSkillInfoListener(sourceName)
end

local function reload()
  unload()
  load()
end

skills =
{
	load = load,
	unload = unload,
	reload = reload,
}

return Skills
