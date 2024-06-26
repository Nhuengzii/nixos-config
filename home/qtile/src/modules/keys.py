from libqtile.lazy import lazy
from libqtile.config import Key
import os

mod = "mod4"
terminal = "xfce4-terminal"
if os.system("which kitty") == 0:
    terminal = "kitty"

keys = [
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], 'backspace', lazy.next_screen(), desc="Next monitor"),
    Key([mod], "w", lazy.spawn("microsoft-edge"), desc="Launch Edge"),
    Key([mod], "f", lazy.window.toggle_floating(), desc="Toggle floating"),
    Key([mod],
        "space",
        lazy.layout.next(),
        desc="Move window focus to other window"),

    Key([mod], "d", lazy.spawn("rofi -show combi"), desc="spawn rofi"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"],
        "h",
        lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([mod, "shift"],
        "l",
        lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    Key([mod, "shift"],
        "j",
        lazy.layout.shuffle_down(),
        desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"],
        "h",
        lazy.layout.grow(),
        desc="Grow window"),
    Key([mod, "control"],
        "l",
        lazy.layout.shrink(),
        desc="Shrink window"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack"),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),

    # Toggle between different layouts as defined below
    Key([mod], "c", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "e", lazy.screen.next_group(), desc="Focus next group"),
    Key([mod], "Tab", lazy.screen.prev_group(), desc="Focus previous group"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "shift", "control"], "h", lazy.layout.swap_column_left()),
    Key([mod, "shift", "control"], "l", lazy.layout.swap_column_right()),
    Key([mod, "shift"], "space", lazy.layout.flip()),
    Key([mod, "control"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod, "shift"],
        "r",
        lazy.spawncmd(),
        desc="Spawn a command using a prompt widget"),
    Key([], "XF86AudioRaiseVolume",lazy.spawn("sh /home/nhuengzii/.config/qtile/scripts/volume_indicator.sh up")),
    Key([], "XF86AudioLowerVolume",lazy.spawn("sh /home/nhuengzii/.config/qtile/scripts/volume_indicator.sh down")),
    Key([], "XF86AudioMute",lazy.spawn("sh /home/nhuengzii/.config/qtile/scripts/volume_indicator.sh mute")),
    Key([], "XF86MonBrightnessUp",lazy.spawn("sh /home/nhuengzii/.config/qtile/scripts/brightness.sh up")),
    Key([], "XF86MonBrightnessDown",lazy.spawn("sh /home/nhuengzii/.config/qtile/scripts/brightness.sh down")),
    Key(["shift"], "Print", lazy.spawn("flameshot gui")),
    Key([], "Print", lazy.spawn("flameshot gui"))
]
