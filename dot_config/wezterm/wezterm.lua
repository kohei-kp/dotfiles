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

return {
    font = wezterm.font_with_fallback({
        {family="HackGen Console NF", weight="Regular", stretch="Normal", style="Normal", italic=false}
    }),
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
