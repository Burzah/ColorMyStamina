local mod = get_mod("ColorMyStamina")

local color_options_1 = {
    { text = "color_1_red",     value = "red" },
    { text = "color_1_orange",  value = "orange" },
    { text = "color_1_yellow",  value = "yellow" },
    { text = "color_1_green",   value = "green" },
    { text = "color_1_blue",    value = "blue" },
    { text = "color_1_white",   value = "white" },
    { text = "color_1_cyan",    value = "cyan" },
    { text = "color_1_magenta", value = "magenta" },
    { text = "color_1_purple",  value = "purple" },
    { text = "color_1_pink",    value = "pink" },
    { text = "color_1_lime",    value = "lime" },
    { text = "color_1_teal",    value = "teal" },
    { text = "color_1_gold",    value = "gold" },
    { text = "color_1_silver",  value = "silver" },
    { text = "color_1_black",   value = "black" },
}

local color_options_2 = {
    { text = "color_2_red",     value = "red" },
    { text = "color_2_orange",  value = "orange" },
    { text = "color_2_yellow",  value = "yellow" },
    { text = "color_2_green",   value = "green" },
    { text = "color_2_blue",    value = "blue" },
    { text = "color_2_white",   value = "white" },
    { text = "color_2_cyan",    value = "cyan" },
    { text = "color_2_magenta", value = "magenta" },
    { text = "color_2_purple",  value = "purple" },
    { text = "color_2_pink",    value = "pink" },
    { text = "color_2_lime",    value = "lime" },
    { text = "color_2_teal",    value = "teal" },
    { text = "color_2_gold",    value = "gold" },
    { text = "color_2_silver",  value = "silver" },
    { text = "color_2_black",   value = "black" },
}

local color_options_3 = {
    { text = "color_3_red",     value = "red" },
    { text = "color_3_orange",  value = "orange" },
    { text = "color_3_yellow",  value = "yellow" },
    { text = "color_3_green",   value = "green" },
    { text = "color_3_blue",    value = "blue" },
    { text = "color_3_white",   value = "white" },
    { text = "color_3_cyan",    value = "cyan" },
    { text = "color_3_magenta", value = "magenta" },
    { text = "color_3_purple",  value = "purple" },
    { text = "color_3_pink",    value = "pink" },
    { text = "color_3_lime",    value = "lime" },
    { text = "color_3_teal",    value = "teal" },
    { text = "color_3_gold",    value = "gold" },
    { text = "color_3_silver",  value = "silver" },
    { text = "color_3_black",   value = "black" },
}

local color_options_4 = {
    { text = "color_4_red",     value = "red" },
    { text = "color_4_orange",  value = "orange" },
    { text = "color_4_yellow",  value = "yellow" },
    { text = "color_4_green",   value = "green" },
    { text = "color_4_blue",    value = "blue" },
    { text = "color_4_white",   value = "white" },
    { text = "color_4_cyan",    value = "cyan" },
    { text = "color_4_magenta", value = "magenta" },
    { text = "color_4_purple",  value = "purple" },
    { text = "color_4_pink",    value = "pink" },
    { text = "color_4_lime",    value = "lime" },
    { text = "color_4_teal",    value = "teal" },
    { text = "color_4_gold",    value = "gold" },
    { text = "color_4_silver",  value = "silver" },
    { text = "color_4_black",   value = "black" },
}

return {
    name = mod:localize("mod_name"),
    description = mod:localize("mod_description"),
    is_togglable = true,
    options = {
        widgets = {
            {
                setting_id = "threshold_1",
                type = "numeric",
                default_value = 25,
                range = {0, 100},
            },
            {
                setting_id = "color_1",
                type = "dropdown",
                default_value = "red",
                options = color_options_1,
            },
            {
                setting_id = "threshold_2",
                type = "numeric",
                default_value = 50,
                range = {0, 100},
            },
            {
                setting_id = "color_2",
                type = "dropdown",
                default_value = "orange",
                options = color_options_2,
            },
            {
                setting_id = "threshold_3",
                type = "numeric",
                default_value = 75,
                range = {0, 100},
            },
            {
                setting_id = "color_3",
                type = "dropdown",
                default_value = "yellow",
                options = color_options_3,
            },
            {
                setting_id = "threshold_4",
                type = "numeric",
                default_value = 100,
                range = {0, 100},
            },
            {
                setting_id = "color_4",
                type = "dropdown",
                default_value = "green",
                options = color_options_4,
            },
        }
    }
}
