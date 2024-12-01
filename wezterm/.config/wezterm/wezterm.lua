local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "Catppuccin Mocha"
config.hide_tab_bar_if_only_one_tab = true
config.font = wezterm.font({
	family = "JetBrains Mono",
	-- Disable font ligatures, making it easier to see the actual characters that I'm editing.
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
})

-- Workaround for https://github.com/wez/wezterm/issues/5990.
config.front_end = "WebGpu"

return config
