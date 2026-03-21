return {
        run = function()
                fassert(rawget(_G, "new_mod"), "ColorMyStamina requires the Darktide Mod Framework.")

                new_mod("ColorMyStamina", {
                        mod_script       = "ColorMyStamina/scripts/mods/ColorMyStamina/ColorMyStamina",
                        mod_data         = "ColorMyStamina/scripts/mods/ColorMyStamina/ColorMyStamina_data",
                        mod_localization = "ColorMyStamina/scripts/mods/ColorMyStamina/ColorMyStamina_localization",
                })
        end,
        packages = {},
        version = 1.0.0,
}
