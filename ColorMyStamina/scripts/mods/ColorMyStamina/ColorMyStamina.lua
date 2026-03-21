local mod = get_mod("ColorMyStamina")

local COLORS = {
    red     = {255, 255,   0,   0},
    orange  = {255, 255, 165,   0},
    yellow  = {255, 255, 255,   0},
    green   = {255,   0, 255,   0},
    blue    = {255,   0, 128, 255},
    white   = {255, 255, 255, 255},
    cyan    = {255,   0, 255, 255},
    magenta = {255, 255,   0, 255},
    purple  = {255, 128,   0, 255},
    pink    = {255, 255, 105, 180},
    lime    = {255, 191, 255,   0},
    teal    = {255,   0, 180, 180},
    gold    = {255, 255, 215,   0},
    silver  = {255, 192, 192, 192},
    black   = {255,   0,   0,   0},
}

mod:hook("HudElementStamina", "_draw_stamina_chunks", function(func, self, dt, t, ui_renderer)
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

            local t1 = mod:get("threshold_1") or 25
            local t2 = mod:get("threshold_2") or 50
            local t3 = mod:get("threshold_3") or 75
            local t4 = mod:get("threshold_4") or 100
            local c1 = mod:get("color_1") or "red"
            local c2 = mod:get("color_2") or "orange"
            local c3 = mod:get("color_3") or "yellow"
            local c4 = mod:get("color_4") or "green"

            local percent = stamina_fraction * 100

            local thresholds = {
                {value = t1, color = c1},
                {value = t2, color = c2},
                {value = t3, color = c3},
                {value = t4, color = c4},
            }
            table.sort(thresholds, function(a, b) return a.value < b.value end)

            local color_key = thresholds[#thresholds].color
            for i = 1, #thresholds do
                if percent <= thresholds[i].value then
                    color_key = thresholds[i].color
                    break
                    end
                    end

                    local rgba = COLORS[color_key] or COLORS["green"]

                    local widget = self._widgets_by_name.stamina_bar
                    if widget then
                        if widget.style.bar_fill then
                            local c = widget.style.bar_fill.color
                            c[1], c[2], c[3], c[4] = rgba[1], rgba[2], rgba[3], rgba[4]
                            end
                            if widget.style.bar_spent then
                                local sc = widget.style.bar_spent.color
                                sc[1], sc[2], sc[3], sc[4] = 150, rgba[2], rgba[3], rgba[4]
                                end
                                end

                                if self._stamina_nodge_widget then
                                    local nc = self._stamina_nodge_widget.style.nodges.color
                                    nc[1], nc[2], nc[3], nc[4] = rgba[1], rgba[2], rgba[3], rgba[4]
                                    end

                                    return func(self, dt, t, ui_renderer)
                                    end)
