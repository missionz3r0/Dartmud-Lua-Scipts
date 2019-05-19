--[[ Dartmud Date module
- Special thanks to Ogma for making this module even better, with his help this module is now as true to DartMUD's date system as possible
  (within the accuracy of your computers clock)

- Methods:
-- date.queryDate(secs, reckoning)
-- date.queryMonth(secs, reckoning)
-- date.queryYear(secs, reckoning)
-- date.queryMonthName(secs|-monthIdx, reckoning, abbrev)
-- date.queryDayOfWeek(secs, reckoning)
-- date.queryDayName(secs|-dayIdx, reckoning)
-- date.validReckoning(reckoning)
-- date.parseReckoning(str)
-- date.format(secs, mode, reckoning)
--]]

date = {};

local OFFSET = 0;
local ROWAN_START_DATE = 0;
local ELVISH_START_DATE = 0;
local ADACHIAN_START_DATE = -864000; -- -3 common years offset

local ROWAN_START_YEAR = 1100;
local ELVISH_START_YEAR = 0;
local ADACHIAN_START_YEAR = 1832;

local COMMON_HOUR = 600; -- 1 common hour = 10 minutes
local COMMON_DAY = 14400; -- 1 common day = 4 hours

local ELVISH_MONTH = 216000; -- 1 common month = 15 common days = 2.5 days
local ELVISH_YEAR = 2592000; -- 1 common year = 12 common months = 30 days
local ROWAN_MONTH = 345600;  -- 1 thorpian month = 24 common days = 4 days
local ROWAN_YEAR = 2764800;  -- 1 thorpian year = 8 thorpian months = 32 days

local SIDEREAL_YEAR = ELVISH_YEAR;

local RECKONINGS = {[0] = "common", [1] = "thorpian", [2] = "adachian"};

local MONTH_LENGTH = {[0] = ELVISH_MONTH, [1] = ROWAN_MONTH, [2] = ELVISH_MONTH};
local YEAR_LENGTH = {[0] = ELVISH_YEAR, [1] = ROWAN_YEAR, [2] = ELVISH_YEAR};
local DATE_OFFSET = {[0] = ELVISH_START_DATE, [1] = ROWAN_START_DATE, [2] = ADACHIAN_START_DATE};
local YEAR_OFFSET = {[0] = ELVISH_START_YEAR, [1] = ROWAN_START_YEAR, [2] = ADACHIAN_START_YEAR};

local COMMON_MONTHS = {
	[0] = "frostflower",
	[1] = "icemoon",
	[2] = "wolfmoon",
	[3] = "wintersebb",
	[4] = "saprise",
	[5] = "petalspread",
	[6] = "greentide",
	[7] = "midsummer",
	[8] = "berrymoon",
	[9] = "cornripe",
	[10] = "harvestmoon",
	[11] = "winnowing"
};

local COMMON_MONTHS_ABBREV = {
	[0] = "ffl",
	[1] = "ice",
	[2] = "wlf",
	[3] = "web",
	[4] = "sap",
	[5] = "ptl",
	[6] = "grt",
	[7] = "mid",
	[8] = "bry",
	[9] = "crn",
	[10] = "hvt",
	[11] = "win"
};

local THORPIAN_MONTHS = {
	[0] = "red",
	[1] = "orange",
	[2] = "yellow",
	[3] = "green",
	[4] = "blue",
	[5] = "indigo",
	[6] = "violet",
	[7] = "octarine"
};

local THORPIAN_MONTHS_ABBREV = {
	[0] = "red",
	[1] = "org",
	[2] = "ylw",
	[3] = "grn",
	[4] = "blu",
	[5] = "ind",
	[6] = "vio",
	[7] = "oct"
};

local ADACHIAN_MONTHS = {
	[0] = "yayoi",
	[1] = "uzuki",
	[2] = "satsuki",
	[3] = "minazuki",
	[4] = "fumizuki",
	[5] = "hazuki",
	[6] = "nagatsuki",
	[7] = "kannazuki",
	[8] = "shimotsuki",
	[9] = "shiwasu",
	[10] = "mutsuki",
	[11] = "kisaragi"
};

local ADACHIAN_MONTHS_ABBREV = {
	[0] = "yay",
	[1] = "uzu",
	[2] = "saz",
	[3] = "min",
	[4] = "fum",
	[5] = "haz",
	[6] = "nag",
	[7] = "kan",
	[8] = "shm",
	[9] = "shw",
	[10] = "muz",
	[11] = "kis"
};

local MONTH_NAME = {
	[0] = COMMON_MONTHS,
	[1] = THORPIAN_MONTHS,
	[2] = ADACHIAN_MONTHS
};

local MONTH_NAME_ABBREV = {
	[0] = COMMON_MONTHS_ABBREV,
	[1] = THORPIAN_MONTHS_ABBREV,
	[2] = ADACHIAN_MONTHS_ABBREV
};

local COMMON_WEEKDAYS = {
	[0] = "martin",
	[1] = "mahasa",
	[2] = "tannorat'h",
	[3] = "anastasia",
	[4] = "sulamar",
	[5] = "dannika"
};

local THORPIAN_WEEKDAYS = {
	[0] = "flic",
	[1] = "ic",
	[2] = "mla",
	[3] = "orl",
	[4] = "dri",
	[5] = "sic",
	[6] = "lor",
	[7] = "cim"
};

local ADACHIAN_WEEKDAYS = {
	[0] = "homura",
	[1] = "mizu",
	[2] = "moku",
	[3] = "kane",
	[4] = "seki",
	[5] = "kuu"
};

local WEEKDAY = {
	[0] = COMMON_WEEKDAYS,
	[1] = THORPIAN_WEEKDAYS,
	[2] = ADACHIAN_WEEKDAYS
};

local COMMON_WEEKEND = {
	[0] = "dannika"
};

local THORPIAN_WEEKEND = {
	[0] = "lor",
	[1] = "cim"
};

local ADACHIAN_WEEKEND = {
	[0] = "kuu"
};

local WEEKEND = {
	[0] = COMMON_WEEKEND,
	[1] = THORPIAN_WEEKEND,
	[2] = ADACHIAN_WEEKEND
};

local COMMON_HOLIDAYS = {
		["1 frostflower"] = "New Year's Day",
		["8 ice moon"] = "Festival of Lights",
		["1 wintersebb"] = "Festival of Quickening",
		["14 wintersebb"] = "Sun Day",
		["8 saprise"] = "Spring Equinox",
		["1 greentide"] = "Festival of Flowers",
		["8 midsummer"] = "Summer Solstice",
		["1 cornripe"] = "Harvest Festival",
		["4 cornripe"] = "The Hand of Sulamar",
		["8 harvestmoon"] = "Festival of Trees"
	};

local THORPIAN_HOLIDAYS = {
		["1 red"] = "New Year's Day",
		["7 orange"] = "The Hand of Sulamar",
		["11 indigo"] = "Sun Day"
	};

local ADACHIAN_HOLIDAYS = {
		["1 yayoi"] = "Ganjitsu (New Year's Day)",
		["7 hazuki"] = "Obon",
		["4 shimotsuki"] = "Emperor's Birthday"
	};

local HOLIDAYS = {
	[0] = COMMON_HOLIDAYS,
	[1] = THORPIAN_HOLIDAYS,
	[2] = ADACHIAN_HOLIDAYS
};

function date.queryDate(secs, reckoning)
	if not secs then
		secs = os.time();
	end

	reckoning = date.parseReckoning(reckoning);

	if reckoning < 0 then
		return os.date():sub(9,10);
	end

	secs = secs + OFFSET + DATE_OFFSET[reckoning];
	return math.floor((secs % MONTH_LENGTH[reckoning]) / COMMON_DAY + 1);
end

function date.queryMonth(secs, reckoning)
	if not date.validReckoning(reckoning) then
		return 0;
	end

	secs = secs + OFFSET + DATE_OFFSET[reckoning];
	return math.floor((secs % YEAR_LENGTH[reckoning]) / MONTH_LENGTH[reckoning] + 1);
end

function date.queryYear(secs, reckoning)
	reckoning = date.parseReckoning(reckoning);

	if reckoning < 0 then
		return os.date():sub(21,24);
	end

	secs = secs + OFFSET + DATE_OFFSET[reckoning];
	return math.floor(secs / YEAR_LENGTH[reckoning] + YEAR_OFFSET[reckoning]);
end

function date.queryMonthName(secs, reckoning, abbrev)
	local month;
	reckoning = date.parseReckoning(reckoning);

	if reckoning < 0 then
		return os.date():sub(5,7);
	end

	if secs == 0 then
		month = date.queryMonth(os.time(), reckoning);
	elseif secs > 0 then
		month = date.queryMonth(secs, reckoning);
	else
		month = -secs;
	end

	if month < 1 or month > utils.sizeOf(MONTH_NAME[reckoning]) then
		return 0;
	end

	if not abbrev then
		return MONTH_NAME[reckoning][month - 1];
	else
		return MONTH_NAME_ABBREV[reckoning][month - 1];
	end
end

function date.queryDayOfWeek(secs, reckoning)
	if not date.validReckoning(reckoning) then
		return 0;
	end

	secs = secs + OFFSET + DATE_OFFSET[reckoning];
	return math.floor(secs / COMMON_DAY % utils.sizeOf(WEEKDAY[reckoning]) + 1);
end

function date.queryDayName(secs, reckoning)
	local day;
	reckoning = date.parseReckoning(reckoning);

	if reckoning < 0 then
		return os.date():sub(1,3);
	end

	if secs > 0 then
		day = date.queryDayOfWeek(secs, reckoning);
	else
		day = -secs;
	end

	return WEEKDAY[reckoning][day - 1];
end

--[[
 Returns 0 for invalid reckonings or idx
 Returns 1 for valid reckonings or idx
--]]
function date.validReckoning(reckoning)
	if type(reckoning) == "string" then
		return (utils.member(RECKONINGS, reckoning) > -1);
	end

	if type(reckoning) == "number" then
		return (reckoning >= 0 and reckoning < utils.sizeOf(RECKONINGS));
	end

	return 0;
end

--[[
 Return idx for reckonings
	OOC: -1
	Common: 0
	Thorpian: 1
	Adachian: 2
--]]
function date.parseReckoning(str)
	local reckoningIdx;

	if not str or str == "" then
		return 0;
	end

	if type(str) == "string" then
		str = string.lower(str);

		if str == "ooc" then
			return -1;
		else
			reckoningIdx = utils.member(RECKONINGS, str);
			if reckoningIdx then
				return reckoningIdx;
			else
				return 0;
			end
		end
	else
		if str < 0 then
			return 0;
		end

		reckoningIdx = str;
		if reckoningIdx >= 0 and reckoningIdx <= utils.sizeOf(RECKONINGS) then
			return reckoningIdx;
		else
			return 0;
		end
	end

	return reckoningIdx;
end

--[[
 Returns a formatted date string based on the mode selected
	0: "Martin, Winnowing 10, 548"
	1: 548 (year)
	2: "Winnowing, 548"
	3: "Winnowing 10, 548"
	4: "Winnowing 10"
	5: 10 (date of month)
	6: 12 (numeric month)
--]]
function date.format(secs, mode, reckoning)
	local ret;

	if not secs or secs == 0 then
		secs = os.time();
	end

	if not mode or mode < 0 then
		mode = 0;
	end

	reckoning = date.parseReckoning(reckoning);
	if mode == 0 then
		ret = utils.capitalize(date.queryDayName(secs, reckoning)) .. ", " .. utils.capitalize(date.queryMonthName(secs, reckoning)) .. " " .. date.queryDate(secs, reckoning).. ", " .. date.queryYear(secs, reckoning);
	elseif mode == 1 then
		ret = date.queryYear(secs, reckoning);
	elseif mode == 2 then
		ret = utils.capitalize(date.queryMonthName(secs, reckoning)) .. ", " .. date.queryYear(secs, reckoning);
	elseif mode == 3 then
		ret = utils.capitalize(date.queryMonthName(secs, reckoning)) .. " " .. date.queryDate(secs, reckoning) .. ", " .. date.queryYear(secs, reckoning);
	elseif mode == 4 then
		ret = utils.capitalize(date.queryMonthName(secs, reckoning)) .. " " .. date.queryDate(secs, reckoning);
	elseif mode == 5 then
		ret = date.queryDate(secs, reckoning);
	elseif mode ==  6 then
		ret = date.queryMonth(secs, reckoning);
	else
		ret = date.format(secs, 0, reckoning);
	end

	return ret;
end

return date;
