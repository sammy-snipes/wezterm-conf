local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()

-- Font
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 12

-- Window
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.925
config.window_padding = { left = 8, right = 8, top = 8, bottom = 8 }
config.adjust_window_size_when_changing_font_size = false

-- Dim inactive panes
config.inactive_pane_hsb = {
  saturation = 0.9,
  brightness = 0.7,
}

-- Color scheme
config.color_scheme = "Catppuccin Mocha"

-- Catppuccin Mocha palette for tab bar
local mocha = {
  base = "#1e1e2e",
  surface0 = "#313244",
  surface1 = "#45475a",
  text = "#cdd6f4",
  subtext0 = "#a6adc8",
  mauve = "#cba6f7",
  blue = "#89b4fa",
}

-- Tab bar styling
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.tab_max_width = 32
config.colors = {
  tab_bar = {
    background = mocha.base,
    active_tab = {
      bg_color = mocha.surface1,
      fg_color = mocha.mauve,
      intensity = "Bold",
    },
    inactive_tab = {
      bg_color = mocha.base,
      fg_color = mocha.subtext0,
    },
    inactive_tab_hover = {
      bg_color = mocha.surface0,
      fg_color = mocha.text,
    },
    new_tab = {
      bg_color = mocha.base,
      fg_color = mocha.subtext0,
    },
    new_tab_hover = {
      bg_color = mocha.surface0,
      fg_color = mocha.mauve,
    },
  },
}

-- ============================================================================
--  STATUS BAR EXPERIMENTS - uncomment one at a time to try
-- ============================================================================

-- OPTION 1: "the void whispers back"
-- Minimal. Just a breathing dot that changes with the seconds.
--[[
wezterm.on("update-status", function(window, pane)
  local dots = { "?", "?", "?", "?", "?", "?", "?", "?" }
  local idx = (os.time() % 8) + 1
  window:set_right_status(wezterm.format({
    { Foreground = { Color = mocha.mauve } },
    { Text = "  " .. dots[idx] .. "  " },
  }))
end)
]]

-- OPTION 2: "corporate synergy"
-- Aggressively professional. Shows everything. Powerline arrows.
--[[
wezterm.on("update-status", function(window, pane)
  local cwd = pane:get_current_working_dir()
  local cwd_path = cwd and cwd.file_path or "~"
  cwd_path = cwd_path:gsub("^/Users/[^/]+", "~")
  local time = wezterm.strftime("%H:%M")
  local date = wezterm.strftime("%a %b %d")
  local hostname = wezterm.hostname():gsub("%.local$", "")

  window:set_right_status(wezterm.format({
    { Foreground = { Color = mocha.base } },
    { Background = { Color = mocha.surface1 } },
    { Text = "  " .. cwd_path .. " " },
    { Foreground = { Color = mocha.surface1 } },
    { Background = { Color = mocha.blue } },
    { Text = "" },
    { Foreground = { Color = mocha.base } },
    { Text = " ? " .. date .. " " },
    { Foreground = { Color = mocha.blue } },
    { Background = { Color = mocha.mauve } },
    { Text = "" },
    { Foreground = { Color = mocha.base } },
    { Text = "  " .. time .. " " },
  }))
end)
]]

-- OPTION 3: "2am thoughts"
-- Shows a random kaomoji that changes every 30 seconds
--[[
wezterm.on("update-status", function(window, pane)
  local moods = {
    "(._.) ", "(-_-) zzZ", "(o_O) ?!", "(^_^) ~", "(>_<) !",
    "(@_@) ", "(T_T) ", "(~_~) ", "?????? ", "(???°??°)???",
    "( ????)????????", "??(?????????)?", "(._.)", "(????????????)???", "( ?? ?? ??))",
  }
  local idx = (math.floor(os.time() / 30) % #moods) + 1
  window:set_right_status(wezterm.format({
    { Foreground = { Color = mocha.subtext0 } },
    { Text = moods[idx] .. "  " },
  }))
end)
]]

-- OPTION 4: "the machine speaks"
-- Fake terminal output aesthetic. Scrolling hex.
--[[
wezterm.on("update-status", function(window, pane)
  local t = os.time()
  local hex = string.format("0x%08X", t * 31337)
  local mem = string.format("%.1fG", (t % 32) + 1.5)
  window:set_left_status(wezterm.format({
    { Foreground = { Color = "#50fa7b" } },
    { Text = "  [" .. hex .. "] " },
  }))
  window:set_right_status(wezterm.format({
    { Foreground = { Color = mocha.subtext0 } },
    { Text = "mem:" .. mem .. " pid:" .. tostring(pane:pane_id()) .. "  " },
  }))
end)
]]

-- OPTION 5: "liminal space"
-- Just shows how deep you are. Pane index. Nothing else.
--[[
wezterm.on("update-status", function(window, pane)
  local tab = window:active_tab()
  local panes = tab:panes()
  local idx = 1
  for i, p in ipairs(panes) do
    if p:pane_id() == pane:pane_id() then idx = i break end
  end
  local depth = string.rep("~", idx) .. string.rep("?", #panes - idx)
  window:set_right_status(wezterm.format({
    { Foreground = { Color = mocha.surface1 } },
    { Text = "  " .. depth .. "  " },
  }))
end)
]]

-- OPTION 6: "solar system"
-- Shows moon phase based on actual lunar cycle
--[[
wezterm.on("update-status", function(window, pane)
  local known_new = 1733630400  -- Dec 8 2024 new moon
  local lunar_cycle = 2551443  -- seconds in lunar cycle
  local phase = ((os.time() - known_new) % lunar_cycle) / lunar_cycle
  local moons = { "??", "??", "??", "??", "??", "??", "??", "??" }
  local idx = math.floor(phase * 8) + 1
  local time = wezterm.strftime("%H:%M")
  window:set_right_status(wezterm.format({
    { Text = "  " .. moons[idx] .. " " .. time .. "  " },
  }))
end)
]]

-- OPTION 7: "progress bar of life"
-- Shows how much of the day/year has elapsed
--[[
wezterm.on("update-status", function(window, pane)
  local now = os.date("*t")
  local day_progress = (now.hour * 3600 + now.min * 60 + now.sec) / 86400
  local year_progress = (now.yday - 1 + day_progress) / 365
  local function bar(pct, len)
    local filled = math.floor(pct * len)
    return string.rep("?", filled) .. string.rep("?", len - filled)
  end
  window:set_right_status(wezterm.format({
    { Foreground = { Color = mocha.blue } },
    { Text = "day " .. bar(day_progress, 6) .. " " },
    { Foreground = { Color = mocha.mauve } },
    { Text = "year " .. bar(year_progress, 6) .. "  " },
  }))
end)
]]

-- Keybindings
config.keys = {
  -- Vim-style splits (Cmd+hjkl)
  { key = "h", mods = "CMD", action = act.SplitPane({ direction = "Left" }) },
  { key = "j", mods = "CMD", action = act.SplitPane({ direction = "Down" }) },
  { key = "k", mods = "CMD", action = act.SplitPane({ direction = "Up" }) },
  { key = "l", mods = "CMD", action = act.SplitPane({ direction = "Right" }) },

  -- Vim-style pane navigation (Ctrl+hjkl)
  { key = "h", mods = "CTRL", action = act.ActivatePaneDirection("Left") },
  { key = "j", mods = "CTRL", action = act.ActivatePaneDirection("Down") },
  { key = "k", mods = "CTRL", action = act.ActivatePaneDirection("Up") },
  { key = "l", mods = "CTRL", action = act.ActivatePaneDirection("Right") },

  -- Pane management
  { key = "w", mods = "CMD", action = act.CloseCurrentPane({ confirm = true }) },
  { key = "z", mods = "CMD", action = act.TogglePaneZoomState },

  -- Zoom (font size) - using CTRL to avoid macOS window zoom interception
  { key = "=", mods = "CTRL", action = act.IncreaseFontSize },
  { key = "-", mods = "CTRL", action = act.DecreaseFontSize },
  { key = "0", mods = "CTRL", action = act.ResetFontSize },

  -- Resize panes (Cmd+Shift+hjkl)
  { key = "h", mods = "CMD|SHIFT", action = act.AdjustPaneSize({ "Left", 5 }) },
  { key = "j", mods = "CMD|SHIFT", action = act.AdjustPaneSize({ "Down", 5 }) },
  { key = "k", mods = "CMD|SHIFT", action = act.AdjustPaneSize({ "Up", 5 }) },
  { key = "l", mods = "CMD|SHIFT", action = act.AdjustPaneSize({ "Right", 5 }) },
}

return config
