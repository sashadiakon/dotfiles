-- Montior wiki https://wiki.hypr.land/Configuring/Basics/Monitors/
-- Assing workspaces to monitors

-- My monitors settings
hl.monitor({ output = "DP-1", mode = "2560x1440@180", position = "0x0", scale = 1 })
hl.monitor({ output = "DP-2", mode = "1920x1080", position="auto-right", scale = 1 })
-- FOr random monitors
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = 1})
hl.workspace_rule({ workspace = "1", monitor = "DP-1" })
hl.workspace_rule({ workspace = "2", monitor = "DP-1" })
hl.workspace_rule({ workspace = "3", monitor = "DP-1" })
hl.workspace_rule({ workspace = "4", monitor = "DP-1" })
hl.workspace_rule({ workspace = "5", monitor = "DP-1" })
hl.workspace_rule({ workspace = "6", monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "7", monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "8", monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "9", monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "10", monitor = "HDMI-A-1" })
