local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- See https://wezterm.org/config/lua/wezterm.gui/get_appearance.html
function get_appearance()
	if wezterm.gui then
		return wezterm.gui.get_appearance()
	end
	return "Dark"
end

function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "Catppuccin Mocha"
	else
		return "Catppuccin Latte"
	end
end

config.color_scheme = scheme_for_appearance(get_appearance())
config.hide_tab_bar_if_only_one_tab = true
config.font = wezterm.font({
	family = "JetBrains Mono",
	-- Disable font ligatures, making it easier to see the actual characters that I'm editing.
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
})

-- Workaround for https://github.com/wez/wezterm/issues/5990.
config.front_end = "WebGpu"

return config
