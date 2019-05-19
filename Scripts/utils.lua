utils = {};

function utils.member(tbl, item)
	for key, value in pairs(tbl) do
		if value == item then
			return key;
		end
	end
	return -1;
end

function utils.sizeOf(tbl)
	return #tbl + 1;
end

function utils.capitalize(str)
	if not str then
		str = "";
	end

	str = tostring(str);

	return string.upper(str:sub(1,1)) .. str:sub(2);
end

return utils;
