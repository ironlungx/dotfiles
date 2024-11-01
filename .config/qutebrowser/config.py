import os
from urllib.request import urlopen
from qutebrowser.api import interceptor

config.load_autoconfig()

if os.path.exists(config.configdir / "theme.py"):
    import theme
    theme.setup(c, 'mocha', True)

c.url.searchengines = {
    "DEFAULT": "https://duckduckgo.com/?q={}",
    "p": "https://www.perplexity.ai/?q={}",
    "aw": "https://wiki.archlinux.org/?search={}",
    "yt": "https://www.youtube.com/results?search_query={}"
}


config.bind('<Ctrl-Shift-t>', 'config-cycle tabs.show always switching')
