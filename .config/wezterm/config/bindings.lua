local wezterm = require("wezterm")
local act = wezterm.action

local keys = {
  { key = "x", mods = "LEADER", action = act.ActivateCopyMode },
  { key = "a", mods = "LEADER|CTRL", action = act.SendKey({ key = "a", mods = "CTRL" }) },

  -- Pane keybindings
  -- split
  { key = "s", mods = "LEADER", action = act.ActivateKeyTable({ name = "split_pane", timeout_milliseconds = 3600 }) },
  -- activate
  { key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
  { key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
  { key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
  { key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
  -- quit
  { key = "q", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },
  -- resize
  { key = "r", mods = "LEADER", action = act.ActivateKeyTable({ name = "resize_pane", one_shot = false }) },

  -- Tab keybindings
  { key = "t", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
  { key = "m", mods = "LEADER", action = act.ActivateKeyTable({ name = "move_tab", one_shot = false }) },

  -- Launcher
  { key = "w", mods = "LEADER", action = act.ShowLauncherArgs({ flags = "FUZZY|LAUNCH_MENU_ITEMS|DOMAINS|TABS" }) },
}

local key_tables = {
  resize_pane = {
    { key = "h", action = act.AdjustPaneSize({ "Left", 1 }) },
    { key = "j", action = act.AdjustPaneSize({ "Down", 1 }) },
    { key = "k", action = act.AdjustPaneSize({ "Up", 1 }) },
    { key = "l", action = act.AdjustPaneSize({ "Right", 1 }) },
    { key = "Enter", action = "PopKeyTable" },
  },
  split_pane = {
    { key = "Enter", action = "PopKeyTable" },
  },
  move_tab = {
    { key = "h", action = act.MoveTabRelative(-1) },
    { key = "l", action = act.MoveTabRelative(1) },
    { key = "Enter", action = "PopKeyTable" },
  },
}

local launch_menu = require("config.launch").launch_menu

for i = 1, #launch_menu do
  table.insert(key_tables.split_pane, {
    key = tostring(i),
    action = act.SplitHorizontal(launch_menu[i]),
  })
  table.insert(key_tables.split_pane, {
    key = tostring(i),
    mods = "ALT",
    action = act.SplitVertical(launch_menu[i]),
  })
end

return {
  disable_default_key_bindings = false,
  leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1500 },
  keys = keys,
  key_tables = key_tables,
}
