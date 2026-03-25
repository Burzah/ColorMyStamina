--[[
Title: Color My Stamina
Author: Miles
Date: 03/24/2026
Repository: https://github.com/Burzah/ColorMyStamina
Version: 1.0.0
--]]

local InputUtils = require("scripts/managers/input/input_utils")

local function readable(text)
	local readable_string = ""
	for token in string.gmatch(text, "([^_]+)") do
		local first = string.sub(token, 1, 1)
		token = string.format("%s%s", string.upper(first), string.sub(token, 2))
		readable_string = string.trim(string.format("%s %s", readable_string, token))
	end
	return readable_string
end

local localizations = {
	mod_name        = { en = "Color My Stamina" },
	mod_description = { en = "Changes stamina bar colors based on percentage." },
	base_color      = { en = "Base Bar Color" },
	threshold_1     = { en = "Custom Point 1 (%%)" },
	color_1         = { en = "First Color" },
	threshold_2     = { en = "Custom Point 2 (%%)" },
	color_2         = { en = "Second Color" },
	threshold_3     = { en = "Custom Point 3 (%%)" },
	color_3         = { en = "Third Color" },
	threshold_4     = { en = "Custom Point 4 (%%)" },
	color_4         = { en = "Fourth Color" },
}

for _, color_name in ipairs(Color.list) do
	local color_values = Color[color_name](100, true)
	local text = InputUtils.apply_color_to_input_text(readable(color_name), color_values)
	localizations[color_name] = {
		en = text,
	}
end

return localizations