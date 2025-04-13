import os

config.load_autoconfig()

if os.path.exists(config.configdir / "theme.py"):
    import theme
    theme.setup(c, 'frappe', True)

c.url.searchengines = {
    "DEFAULT": "https://duckduckgo.com/?q={}",
    "p": "https://www.perplexity.ai/?q={}",
    "aw": "https://wiki.archlinux.org/?search={}",
    "yt": "https://www.youtube.com/results?search_query={}"
}

c.url.start_pages = ['https://ironlungx.github.io/Bento/']


config.bind('<Ctrl-Shift-t>', 'config-cycle tabs.show always switching')
config.bind('<Ctrl-Shift-s>', 'config-cycle statusbar.show always in-mode')
