local wezterm = require 'wezterm'
local act = wezterm.action
local config = wezterm.config_builder()
--------------------------------------

config.font_size = 14

config.color_scheme = 'carbonfox'
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.window_decorations = "NONE"


-- config.keys = {
--     -- Panes
--     { key = 's', mods = 'ALT', action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
--     { key = 'v', mods = 'ALT', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
--
--     { key = 'q', mods = 'ALT', action = act.CloseCurrentPane { confirm = true } },
--     { key = 'z', mods = 'ALT', action = act.TogglePaneZoomState },
--
--     { key = 'h', mods = 'ALT', action = act.ActivatePaneDirection 'Left' },
--     { key = 'l', mods = 'ALT', action = act.ActivatePaneDirection 'Right' },
--     { key = 'k', mods = 'ALT', action = act.ActivatePaneDirection 'Up' },
--     { key = 'j', mods = 'ALT', action = act.ActivatePaneDirection 'Down' },
--
--     { key = 'h', mods = 'ALT|SHIFT', action = act.AdjustPaneSize { 'Left', 2 } },
--     { key = 'l', mods = 'ALT|SHIFT', action = act.AdjustPaneSize { 'Right', 2 } },
--     { key = 'k', mods = 'ALT|SHIFT', action = act.AdjustPaneSize { 'Up', 2 } },
--     { key = 'j', mods = 'ALT|SHIFT', action = act.AdjustPaneSize { 'Down', 2 } },
-- }

--------------------------------------
return config
