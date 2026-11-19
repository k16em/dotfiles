local wezterm = require('wezterm')

return {
  enable_scroll_bar = true,
  font = wezterm.font('PlemolJP Console'),
  font_size = 10.0,
  colors = {
    foreground = '#586e75',
    background = '#fdf6e3',
    ansi = {
      '#073642',
      '#dc322f',
      '#859900',
      '#b58900',
      '#268bd2',
      '#d33682',
      '#2aa198',
      '#eee8d5',
    },
    brights = {
      '#002b36',
      '#cb4b16',
      '#586e75',
      '#657b83',
      '#839496',
      '#6c71c4',
      '#93a1a1',
      '#fdf6e3',
    },
  },
}
