require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = "gruvbox-baby",
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  sections = {
    lualine_a = {
      {
        'filename',
        path = 1,
      }
    },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  }
}
