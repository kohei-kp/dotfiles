local wezterm = require 'wezterm'
local mux = wezterm.mux

wezterm.on('gui-startup', function(cmd)
    wezterm.log_info("gui-startup: %s", cmd)
    local tab, pane, window = mux.spawn_window(cmd or {})
    window:gui_window():set_position(200, 200)
    window:gui_window():set_inner_size(2560, 1280)
    pane:split { size = 0.7, direction = "Top" }
    pane:split { size = 0.5, direction = "Right" }
end)

local prev_dpi = 0
local dpi_change_num = 96
local dpi_change_font_size = 10

wezterm.on('window-focus-changed', function(window, pane)
    -- dpi取得
    local dpi = window:gui_window():get_dpi()

    if dpi == prev_dpi then
        return
    end

    local overrides = window.get_config_overrides or {}
    overrides.font_size = dpi >= dpi_change_num and dpi_change_font_size or nil
    window:set_config_overrides(overrides)

    prev_dpi = dpi
end)

return {
    font = wezterm.font_with_fallback({
        {family="HackGen Console NF", weight="Regular", stretch="Normal", style="Normal", italic=false}
    }),
    font_size = 12.5,

    color_scheme = "EverforestDark (Gogh)",
    adjust_window_size_when_changing_font_size = false,
    use_ime = true,
    default_cursor_style = "SteadyBar",
    force_reverse_video_cursor = true,
    leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 },
    keys = {
        {
            key = "|",
            mods = "LEADER|SHIFT",
            action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" },
        },
        {
            key = "-",
            mods = "LEADER",
            action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" },
        },
        {
            key = "x",
            mods = "LEADER",
            action = wezterm.action.CloseCurrentPane { confirm = false },
        },
        {
            key = "a",
            mods = "LEADER|CTRL",
            action = wezterm.action.SendString "\x01",
        },
        {
            key = "w",
            mods = "LEADER",
            action = wezterm.action.PaneSelect
        },
    }
}
