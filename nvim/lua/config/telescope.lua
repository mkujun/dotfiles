require('telescope').setup{
  defaults = {
    layout_strategy = 'vertical',
    layout_config = {
      vertical = {
        mirror = false,       -- false puts preview below results (true puts preview above)
        preview_height = 0.5, -- 50% of the vertical space for preview
      },
    },
    -- other default settings
  },
}
