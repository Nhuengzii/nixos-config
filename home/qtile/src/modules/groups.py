from libqtile.config import DropDown, Key, Group, Match, ScratchPad
from libqtile.command import lazy
from .keys import keys, mod

groups = [Group(i) for i in "123456"]
groups.append(Group("7", matches=[Match(wm_class=["discord"])]))

for i in groups:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod],
            i.name,
            lazy.group[i.name].toscreen(),
            desc="Switch to group {}".format(i.name)),

        Key([mod], "Right", lazy.screen.next_group(),
            desc="Switch to next group"),

        Key([mod], "Left", lazy.screen.prev_group(),
            desc="Switch to previous group"),

        # mod1 + shift + letter of group = switch to & move focused window to group
        Key([mod, "shift"],
            i.name,
            lazy.window.togroup(i.name, switch_group=True),
            desc="Switch to & move focused window to group {}".format(i.name)),
        # Or, use below if you prefer not to switch to that group.
        # # mod1 + shift + letter of group = move focused window to group
        # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
        #     desc="move focused window to group {}".format(i.name)),
    ])
keys.append(
    Key([mod, "shift"], "d", lazy.group["7"].toscreen(), desc="Switch to group 7")
)
groups.append(ScratchPad("scratchpad", [
    DropDown("yt-music", "youtube-music", opacity=1, width=0.5, height=0.5, x=0.25, on_focus_lost_hide=False),
    DropDown("term", "kitty", opacity=0.8),
]))
keys.extend([
    Key([mod], "m", lazy.group["scratchpad"].dropdown_toggle("yt-music"), desc="Toggle yt-music"),
    Key([mod, "shift"], "Return", lazy.group["scratchpad"].dropdown_toggle("term"), desc="Toggle terminal"),
])
