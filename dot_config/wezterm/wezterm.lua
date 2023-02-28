local wezterm = require 'wezterm'
local mux = wezterm.mux

wezterm.on('gui-startup', function(cmd)
    wezterm.log_info("gui-startup: %s", cmd)
    local tab, pane, window = mux.spawn_window(cmd or {})
    window:gui_window():set_position(200, 200)
    window:gui_window():set_inner_size(1280, 640)
    pane:split { size = 0.7, direction = "Top" }
    pane:split { size = 0.5, direction = "Right" }
end)
wezterm.on('mux-startup', function(tab)
    wezterm.log_info("mux-startup: %s", tab)
end)

return {
    font = wezterm.font_with_fallback({
        {family="HackGen Console NFJ", weight="Regular", stretch="Normal", style="Normal", italic=false}
    }),
    -- color_scheme = "EverforestDark (Gogh)",
    color_scheme = "iceberg-dark",
    -- color_scheme = "Banana Blueberry"
    -- hide_tab_bar_if_only_one_tab = true,
    adjust_window_size_when_changing_font_size = false,
    use_ime = true,
    default_cursor_style = "SteadyBar",
    force_reverse_video_cursor = true
}
