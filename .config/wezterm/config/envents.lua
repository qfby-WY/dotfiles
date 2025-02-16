local wezterm = require("wezterm")

local M = {}

M.setup = function()
  local GLYPH_SEMI_CIRCLE_LEFT = wezterm.nerdfonts.ple_left_half_circle_thick
  local GLYPH_SEMI_CIRCLE_RIGHT = wezterm.nerdfonts.ple_right_half_circle_thick
  local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider

  local function tab_title(tab_info)
    local title = tab_info.tab_title
    -- if the tab title is explicitly set, take that
    if title and #title > 0 then
      return title
    end
    -- Otherwise, use the title from the active pane in that tab
    return tab_info.active_pane.title
  end

  wezterm.on("format-tab-title", function(tab, _, _, _, _, max_width)
    local background = "#89B4FA"
    local foreground = "#1E1E2E"

    if tab.is_active then
      background = "#CBA6F7"
    end

    local edge_background = "none"
    local edge_foreground = background
    local text_background = "#B4BEFE"

    local title = tab_title(tab)
    local available_with = math.max(0, max_width - 6)
    title = wezterm.truncate_right(title, available_with)

    return {
      { Background = { Color = edge_background } },
      { Foreground = { Color = edge_foreground } },
      { Text = GLYPH_SEMI_CIRCLE_LEFT },
      { Background = { Color = background } },
      { Foreground = { Color = foreground } },
      { Text = tab.tab_index + 1 .. ":" },
      { Background = { Color = text_background } },
      { Foreground = { Color = edge_foreground } },
      { Text = SOLID_RIGHT_ARROW },
      { Background = { Color = text_background } },
      { Foreground = { Color = foreground } },
      { Text = title },
      { Background = { Color = edge_background } },
      { Foreground = { Color = text_background } },
      { Text = GLYPH_SEMI_CIRCLE_RIGHT },
      { Text = " " },
    }
  end)

  wezterm.on("update-status", function(window, _)
    local stat = window:active_workspace()
    local stat_color = "#F7768E"

    if window:leader_is_active() then
      stat = "Leader"
      stat_color = "#BB9AF7"
    end
    if window:active_key_table() then
      stat = window:active_key_table()
      stat_color = "#7DCFFF"
    end

    window:set_right_status(wezterm.format({
      { Foreground = { Color = stat_color } },
      { Text = wezterm.nerdfonts.oct_table .. "  " .. stat },
      { Text = " " },
    }))
  end)
end

return M
