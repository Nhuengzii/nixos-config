from libqtile import hook
import subprocess
from libqtile.utils import send_notification
import os

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.call([home])

@hook.subscribe.startup
def reload():
    home = os.path.expanduser("~/.config/qtile/scripts/startup.sh") 
    subprocess.call([home])

# @hook.subscribe.focus_change
# def change_group():
#     # change background
#     command = "feh --recursive --randomize --bg-fill ~/.config/qtile/wallpapers"
#     subprocess.call([command], shell=True)
