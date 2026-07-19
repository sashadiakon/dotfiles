-- Input configuration

hl.config({
    input = {
        accel_profile = "flat",
        sensitivity = 0,
        force_no_accel = true,
        kb_layout = "us,ua",
        kb_options = "grp:alt_shift_toggle",
        repeat_rate = 50,
        repeat_delay = 200
    },
})

hl.gesture({ fingers = 4, direction = "horizontal", action = "workspace" })
hl.gesture({ fingers = 3, direction = "down",       action = "close" })
hl.gesture({ fingers = 3, direction = "up",         action = "fullscreen" })
hl.gesture({ fingers = 3, direction = "left",       action = "float" })

