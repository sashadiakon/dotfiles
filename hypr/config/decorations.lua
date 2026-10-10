-- Look and feel configuration

-- hl.config({
--     general = {
--         gaps_in = 3,
--         gaps_out = 8,
--         border_size = 2,
--         extend_border_grab_area = 10,
--         resize_on_border = true,
--         col = {
--             active_border = {
--                 colors = { CACHYLGREEN, CACHYDGREEN },
--                 angle = 45,
--             },
--             inactive_border = CACHYGRAY,
--         },
--     },
--     group = {
--         col = {
--             border_active = CACHYLBLUE,
--             border_inactive = CACHYGRAY,
--             border_locked_active = CACHYDBLUE,
--             border_locked_inactive = CACHYGRAY,
--         },
--         groupbar = {
--             col = {
--                 active = CACHYLGREEN,
--                 inactive = CACHYGRAY,
--                 locked_active = CACHYDBLUE,
--                 locked_inactive = CACHYGRAY,
--             },
--         },
--     },
--     decoration = {
--         dim_special = 0.3,
--         rounding = 10,
--         active_opacity = 0.95,
--         inactive_opacity = 0.85,
--         fullscreen_opacity = 1,
--         blur = {
--             size = 5,
--             passes = 4,
--             special = true,
--         },
--     },
-- })
hl.config({
  general = {
    gaps_in = 5,
    gaps_out = 10,
  },

  decoration = {
    rounding = 20,
    rounding_power = 2,

    shadow = {
      enabled = true,
      range = 4,
      render_power = 3,
      color = 0xee1a1a1a,
    },

    blur = {
      enabled = true,
      size = 3,
      passes = 2,
      vibrancy = 0.1696,
    },
  },
})

-- noctalia size + blur
hl.window_rule({
    match = { class = "dev.noctalia.Noctalia" },
    float = true,
    size = { 1080, 920 },
})

hl.layer_rule({
  name = "noctalia",
  match = {
    namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd|window-switcher)$",
  },
  no_anim = true,
  ignore_alpha = 0.5,
  blur = true,
  blur_popups = true,
})
