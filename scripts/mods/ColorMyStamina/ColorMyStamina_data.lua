local mod = get_mod("ColorMyStamina")

local base_colors = {
    { text = "color_default", value = "default"},
    { text = "color_red",     value = "red" },
    { text = "color_orange",  value = "orange" },
    { text = "color_yellow",  value = "yellow" },
    { text = "color_green",   value = "green" },
    { text = "color_blue",    value = "blue" },
    { text = "color_white",   value = "white" },
    { text = "color_cyan",    value = "cyan" },
    { text = "color_magenta", value = "magenta" },
    { text = "color_purple",  value = "purple" },
    { text = "color_pink",    value = "pink" },
    { text = "color_lime",    value = "lime" },
    { text = "color_teal",    value = "teal" },
    { text = "color_gold",    value = "gold" },
    { text = "color_silver",  value = "silver" },
    { text = "color_black",   value = "black" },
}

return {
    name = mod:localize("mod_name"),
    description = mod:localize("mod_description"),
    is_togglable = true,
    options = {
        widgets = {
            { setting_id = "base_color",  type = "dropdown", default_value = "default", options = table.clone(base_colors) },
            { setting_id = "threshold_1", type = "numeric",  default_value = 100,  range = {0, 100} },
            { setting_id = "color_1",     type = "dropdown", default_value = "default", options = table.clone(base_colors) },
            { setting_id = "threshold_2", type = "numeric",  default_value = 75,  range = {0, 100} },
            { setting_id = "color_2",     type = "dropdown", default_value = "default", options = table.clone(base_colors) },
            { setting_id = "threshold_3", type = "numeric",  default_value = 50,  range = {0, 100} },
            { setting_id = "color_3",     type = "dropdown", default_value = "default", options = table.clone(base_colors) },
            { setting_id = "threshold_4", type = "numeric",  default_value = 25, range = {0, 100} },
            { setting_id = "color_4",     type = "dropdown", default_value = "default",  options = table.clone(base_colors) },
        }
    }
}