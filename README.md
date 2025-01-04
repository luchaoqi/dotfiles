<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
Table of Contents

- [To do](#to-do)
- [Software](#software)
- [Resources](#resources)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

Configure `bash_profile` for `bash` and `zsh_profile` for `zsh`.

# To do

find an elegant way to solve the problems:
> [tmux is causing anaconda to use a different python source - Unix & Linux Stack Exchange](https://unix.stackexchange.com/questions/366553/tmux-is-causing-anaconda-to-use-a-different-python-source)  
> For now, I need to add the line `deconda` **before** `conda activate {env_name}`

change zsh/omz installation to sudo mode OR [Install ZSH locally on a system without root permissions](https://gist.github.com/SirDavidLudwig/ede9adaa512f4295130f67aeef508e48)

find shellcheck hook for pre-commit

Add the following to `zsh_profile` to update tmux plugins everytime login:    
`~/.tmux/plugins/tpm/bin/update_plugins all`, refer: [tpm/docs/managing_plugins_via_cmd_line.md at master · tmux-plugins/tpm](https://github.com/tmux-plugins/tpm/blob/master/docs/managing_plugins_via_cmd_line.md)

Jobs in tmux are killed without any errors after ssh timeout:  
[sshd - tmux session killed when disconnecting from ssh - Unix & Linux Stack Exchange](https://unix.stackexchange.com/questions/171503/tmux-session-killed-when-disconnecting-from-ssh)

doubt it might be caused by tpm plugins: 

[Restore not starting processes · Issue #129 · tmux-plugins/tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect/issues/129)

[Plugins don't work · Issue #56 · tmux-plugins/tmux-continuum](https://github.com/tmux-plugins/tmux-continuum/issues/56#issuecomment-653351722)

[tmux-plugins/tmux-continuum: Continuous saving of tmux environment. Automatic restore when tmux is started. Automatic tmux start when computer is turned on.](https://github.com/tmux-plugins/tmux-continuum?tab=readme-ov-file#known-issues)

# Software

[VNC from Windows to Linux – Computer Action Team](https://cat.pdx.edu/platforms/windows/remote-access/vnc-to-linux/) + MobaXterm

[ChrisTitusTech/winutil: Chris Titus Tech's Windows Utility - Install Programs, Tweaks, Fixes, and Updates](https://github.com/ChrisTitusTech/winutil)

[Snipaste](https://www.snipaste.com/) OR [PixPin](https://pixpinapp.com/)

One Note's `Docking to desktop` is already there and no need for windows tiling software anymore  
~[glzr-io/glazewm: GlazeWM is a tiling window manager for Windows inspired by i3wm.](https://github.com/glzr-io/glazewm)~
> combined with [LuisThiamNye/ButteryTaskbar2: Hide the taskbar completely when the Start Menu is not open.](https://github.com/LuisThiamNye/ButteryTaskbar2)

[Flow Launcher](https://www.flowlauncher.com/)  
~[microsoft/PowerToys: Windows system utilities to maximize productivity](https://github.com/microsoft/PowerToys)~
> Ctrl + Space for spotlight-ish feature in Mac

# Resources

switching between different system-level CUDA versions in conda: [Managing Multiple CUDA Versions on a Single Machine: A Comprehensive Guide | by Chayma Zatout | Towards Data Science](https://towardsdatascience.com/managing-multiple-cuda-versions-on-a-single-machine-a-comprehensive-guide-97db1b22acdc#b45b)

[conanhujinming/dotfiles: My dotfiles .files (github.com)](https://github.com/conanhujinming/dotfiles)

[Editors (Vim) · the missing semester of your cs education (mit.edu)](https://missing.csail.mit.edu/2020/editors/)

[Compiling and installing Zsh without root privileges on Stanford's Sherlock (https://sherlock.stanford.edu) for use in tmux](https://gist.github.com/mgbckr/b8dc6d7d228e25325b6dfaa1c4018e78)

[non root user install failed: sudo: no tty present and no askpass program specified · Issue #8 · deluan/zsh-in-docker](https://github.com/deluan/zsh-in-docker/issues/8)

https://github.com/xxh/xxh
