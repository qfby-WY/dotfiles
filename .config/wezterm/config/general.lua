local wezterm = require("wezterm")
local platform = require("utils.platform")
local gpu_adapters = require("utils.gpu-adapter")

local BG_PIC = "Courtside-Sunset.png"
local COLOR_SCHEME = "Catppuccin Mocha"
local PATH_SEP = platform.is_win and "\\" or "/"
local used_scheme = wezterm.color.get_builtin_schemes()[COLOR_SCHEME]

return {
  -- WebGPU
  max_fps = 120,
  front_end = "WebGpu",
  webgpu_power_preference = "HighPerformance",
  webgpu_preferred_adapter = gpu_adapters:pick_best(),

  -- apparence
  color_scheme = COLOR_SCHEME,
  font = wezterm.font_with_fallback({
    "JetBrainsMono Nerd Font Propo",
    "LXGW WenKai Mono Screen",
    "Symbols Nerd Font Mono",
  }),
  font_size = 11.8,
  window_decorations = "INTEGRATED_BUTTONS|RESIZE",
  window_padding = { left = 3, right = 3, top = 2, bottom = 0 },
  window_background_opacity = 1,
  adjust_window_size_when_changing_font_size = false,
  background = {
    {
      source = {
        File = wezterm.config_dir .. PATH_SEP .. "background" .. PATH_SEP .. BG_PIC,
      },
      hsb = { brightness = 0.8, saturation = 1.0 },
    },
    {
      source = { Color = used_scheme.background },
      height = "120%",
      width = "120%",
      vertical_offset = "-10%",
      horizontal_offset = "-10%",
      opacity = 0.95,
    },
  },

  -- cursor
  animation_fps = 120,
  default_cursor_style = "BlinkingBlock",
  cursor_blink_rate = 640,
  cursor_blink_ease_in = "EaseOut",
  cursor_blink_ease_out = "EaseOut",

  initial_rows = 36,
  initial_cols = 135,
  enable_scroll_bar = true,
  scrollback_lines = 3000,
  -- config.win32_system_backdrop = "Acrylic"
  inactive_pane_hsb = {
    saturation = 0.36,
    brightness = 0.5,
  },

  -- tab
  enable_tab_bar = true,
  tab_max_width = 25,
  use_fancy_tab_bar = false,
  show_new_tab_button_in_tab_bar = false,
  switch_to_last_active_tab_when_closing_tab = true,
  colors = {
    tab_bar = { background = "none" },
  },

  exit_behavior = "Close",
}
