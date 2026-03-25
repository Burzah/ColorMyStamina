--[[
Title: Color My Stamina
Author: Miles
Date: 03/24/2026
Repository: https://github.com/Burzah/ColorMyStamina
Version: 1.0.0
--]]

local mod = get_mod("ColorMyStamina")
mod.version = "1.0.0"

local cached_thresholds = {}
local cached_default_color = "green"

local function rebuild_cache()
    local base_c = mod:get("base_color") or "green"

    local t1 = mod:get("threshold_1") or 100
    local t2 = mod:get("threshold_2") or 75
    local t3 = mod:get("threshold_3") or 50
    local t4 = mod:get("threshold_4") or 25

    local c1 = mod:get("color_1") or "green"
    local c2 = mod:get("color_2") or "yellow"
    local c3 = mod:get("color_3") or "orange"
    local c4 = mod:get("color_4") or "red"

    cached_thresholds = {
        {value = t1, color = c1},
        {value = t2, color = c2},
        {value = t3, color = c3},
        {value = t4, color = c4},
    }

    table.sort(cached_thresholds, function(a, b) return a.value < b.value end)
    cached_default_color = base_c
end

mod.on_setting_changed = function()
    rebuild_cache()
end

mod.on_all_mods_loaded = function()
    rebuild_cache()
    mod:info(mod.version)
end

mod:hook("HudElementStamina", "_draw_stamina_chunks", function(func, self, dt, t, ui_renderer)
    if not func then
        return
    end

    if not mod:is_enabled() then
        return func(self, dt, t, ui_renderer)
    end

    local stamina_fraction = self._stamina_fraction or 0
    local parent = self._parent
    local player_extensions = parent and parent:player_extensions()

    if player_extensions then
        local player_unit_data = player_extensions.unit_data
        if player_unit_data then
            local stamina_comp = player_unit_data:read_component("stamina")
            stamina_fraction = stamina_comp and stamina_comp.current_fraction or stamina_fraction
        end
    end

    local percent = stamina_fraction * 100
    local color_key = cached_default_color

    for i = 1, #cached_thresholds do
        if percent <= cached_thresholds[i].value then
            color_key = cached_thresholds[i].color
            break
        end
    end

    local a, r, g, b
    if Color[color_key] then
        a, r, g, b = Color[color_key](255, true)
    else
        a, r, g, b = Color["green"](255, true)
    end

    local widget = self._widgets_by_name.stamina_bar
    if widget then
        if widget.style.bar_fill then
            local c = widget.style.bar_fill.color
            c[1], c[2], c[3], c[4] = a, r, g, b
        end
        if widget.style.bar_spent then
            local sc = widget.style.bar_spent.color
            sc[1], sc[2], sc[3], sc[4] = 150, r, g, b
        end
    end

    return func(self, dt, t, ui_renderer)
end)