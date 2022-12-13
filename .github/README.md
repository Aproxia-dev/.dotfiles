<h1 align=center>🌸 &nbsp; Apro's Dotfiles! &nbsp; 🏡</h1>

<div align=center>
  <br /><img src="/.github/assets/preview.png" width=60%/><br /><br />
  <samp><a href="#%EF%B8%8F-keybinds">Keybinds</a> ⑊ <a href="#-showcase">Showcase</a> ⑊ <a href="#%EF%B8%8F-install-guide">Install Guide</a></samp><br /><br />
</div>

<h2><samp>👋 Welcome!</samp> <img src="https://img.shields.io/github/stars/Aproxia-dev/.dotfiles?color=f5c2e7&labelColor=1e1e2e&style=for-the-badge" align=right /><img src="https://img.shields.io/github/last-commit/Aproxia-dev/.dotfiles?color=b4befe&labelColor=1e1e2e&style=for-the-badge" align=right /></h2>

**Hi hello! Thanks for dropping by!**<br />

<img src="/.github/assets/cat.png" align=right height=200px/>

This is my humble collection of my config files...<br />

I'm guessing that you're here looking for my <b>AwesomeWM</b> configs, or perhaps for a reference for your new sparkly <b>Linux Rice</b>, is that right?<br />

Well, if that's the case, **here's the install guide!**

And if you're planning to use this as inspiration or help to learn how to rice AwesomeWM, **just credit me once you let the world see what you made!**

<sub>Oh and if you like what you see, please drop me a star! I would really appreciate it! ✨</sub>


<h2><samp>💻 Setup Info</samp>
<a href="https://neovim.io"><img src="https://img.shields.io/static/v1?label=&message=Neovim&color=0f191f&style=for-the-badge&logo=neovim&logoColor=ffffff" align=right /></a>
<a href="https://st.suckless.org"><img src="https://img.shields.io/static/v1?label=&message=ST&color=17a&style=for-the-badge&logo=suckless&logoColor=ffffff" align=right /></a>
<a href="https://awesomewm.org"><img src="https://img.shields.io/static/v1?label=&message=AwesomeWM&color=222&style=for-the-badge&logo=awesomewm&logoColor=ffffff" align=right /></a>
<a href="https://archlinux.org"><img src="https://img.shields.io/static/v1?label=&message=Arch%20Linux&color=3ad&style=for-the-badge&logo=archlinux&logoColor=ffffff" align=right /></a>
</h2>

<b>Here's some info about my system setup:</b>

<div>
<img src="/.github/assets/fetch.png" align=right />

<table align=left><tr><td>
<b>- OS: </b><br />
<b>- WM: </b><br />
<b>- Terminal: </b><br />
<b>- Shell: </b><br />
<b>- Editor: </b><br />
<b>- Launcher: </b><br />
<b>- Browser: </b><br />
<b>- File Manager: </b></tr></td></table>

<table><tr><td>
<a href="https://archlinux.org">arch linux</a><br />
<a href="https://awesomewm.org">awesome</a><br />
<a href="https://st.suckless.org">st</a> ┇ <a href="https://github.com/Aproxia-dev/st-flexipatch/">(my build)</a><br />
<a href="https://wiki.archlinux.org/index.php/Zsh">zsh</a><br />
<a href="https://neovim.io">neovim</a><br />
<a href="https://github.com/davatorium/rofi">rofi</a><br />
<a href="https://www.mozilla.org/en-US/firefox">firefox</a><br />
<a href="https://github.com/lxde/pcmanfm">pcmanfm</a></tr></td></table>
</div>

<b>And here are the awesome modules I'm using:</b>

- **[rubato](https://github.com/andOrlando/rubato)**
  - Creates smooth animations with a slope curve
- **[color](https://github.com/andOrlando/color)**
  - A clean and efficient API for color conversion in Lua
- **[bling](https://github.com/BlingCorp/bling)**
  - Adds new layouts, modules, and widgets that try to primarily focus on window management
- **[keyboard_layout](https://github.com/echuraev/keyboard_layout)**
  - A simple keyboard layout switching script &nbsp; <sub>i really wanna rewrite this one on my own later on tbh</sub>

<h2><samp>⌨️ Keybinds</samp></h2>

I use <kbd>Super</kbd> as my `modkey` (You might know it as the <b>Left Windows key</b>!)

Keybinds with the ✒️ icon can be easily changed in the `conf/defaults.lua` file!

<details>
<summary><samp><b>:scroll: List of all keybinds</b></samp></summary>
<h3>Awesome Keybinds</h3>

| <samp>Keybind</samp> | <samp>Action</samp> |
| ------- | ------ |
| <kbd>Super</kbd> + <kbd>/</kbd> | show help |
| <kbd>Super</kbd> + <kbd>Control</kbd> + <kbd>r</kbd> | reload awesome |
| <kbd>Super</kbd> + <kbd>Backspace</kbd> | quit awesome |

<h3>Client Keybinds</h3>

| <samp>Keybind</samp> | <samp>Action</samp> |
| ------- | ------ |
| <kbd>Super</kbd> + <kbd>j</kbd> / <kbd>k</kbd> | focus next/prev by index |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>j</kbd> / <kbd>k</kbd> | swap with prev/next client by index |
| <kbd>Super</kbd> + <kbd>space</kbd> | move client to the top of the stack |
| <kbd>Super</kbd> + <kbd>q</kbd> | close |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>,</kbd> / <kbd>.</kbd> | move to prev/next screen |

<h3>Tab Keybinds</h3>

| <samp>Keybind</samp> | <samp>Action</samp> |
| ------- | ------ |
| <kbd>Super</kbd> + <kbd>t</kbd> | add a client to a tabbing group |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>t</kbd> | remove a client from a tabbing group |
| <kbd>Super</kbd> (+ <kbd>Shift</kbd>) + <kbd>n</kbd> / <kbd>p</kbd> | iterate through tabs |

<h3>Rofi Keybinds</h3>

| <samp>Keybind</samp> | <samp>Action</samp> |
| ------- | ------ |
| <kbd>Super</kbd> + <kbd>r</kbd> | run launcher |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>r</kbd> | run command prompt |

<h3>Screen Keybinds</h3>

| <samp>Keybind</samp> | <samp>Action</samp> |
| ------- | ------ |
| <kbd>Super</kbd> + <kbd>,</kbd> / <kbd>.</kbd> | focus the prev/next screen |

<h3>Launcher Keybinds</h3>

| <samp>Keybind</samp> | <samp>Action</samp> |
| ------- | ------ |
| <kbd>Super</kbd> + <kbd>Enter</kbd> | open a terminal <sup>✒️</sup> |
| <kbd>Super</kbd> + <kbd>w</kbd> | open a web browser <sup>✒️</sup> |
| <kbd>Super</kbd> + <kbd>m</kbd> | open a mail client <sup>✒️</sup> |
| <kbd>Super</kbd> + <kbd>e</kbd> | open a file manager <sup>✒️</sup> |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>e</kbd> | open a terminal file manager <sup>✒️</sup> |
| <kbd>Super</kbd> + <kbd>s</kbd> | open a music player <sup>✒️</sup> |
| <kbd>Super</kbd> + <kbd>d</kbd> | open an emoji picker <sup>✒️</sup> |

<h3>Layout Keybinds</h3>

| <samp>Keybind</samp> | <samp>Action</samp> |
| ------- | ------ |
| <kbd>Super</kbd> + <kbd>h</kbd> / <kbd>l</kbd> | inc/decrease master width factor |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>h</kbd> / <kbd>l</kbd> | inc/decrease the number of master clients |
| <kbd>Super</kbd> + <kbd>Control</kbd> + <kbd>h</kbd> / <kbd>l</kbd> | inc/decrease the number of columns |
| <kbd>Super</kbd> + <kbd>Control</kbd> + <kbd>j</kbd> / <kbd>k</kbd> | change to the prev/next layout |

<h3>Flag Keybinds</h3>

| <samp>Keybind</samp> | <samp>Action</samp> |
| ------- | ------ |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>x</kbd> | restore minimized |
| <kbd>Super</kbd> + <kbd>f</kbd> | toggle fullscreen |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>space</kbd> | toggle floating |
| <kbd>Super</kbd> + <kbd>z</kbd> | (un)maximize |
| <kbd>Super</kbd> + <kbd>x</kbd> | minimize |
| <kbd>Super</kbd> + <kbd>c</kbd> | toggle keep on top |
| <kbd>Super</kbd> + <kbd>b</kbd> | toggle bar |

<h3>Keyboard Layout Keybinds</h3>

| <samp>Keybind</samp> | <samp>Action</samp> |
| ------- | ------ |
| <kbd>Super</kbd> + <kbd>a</kbd> | switch keyboard layout |
| <kbd>Alt</kbd> + <kbd>Shift</kbd> | switch keyboard layout |

<h3>Screenshot Keybinds</h3>

| <samp>Keybind</samp> | <samp>Action</samp> |
| ------- | ------ |
| <kbd>Insert</kbd> | take a screenshot of the monitor |
| <kbd>Control</kbd> + <kbd>Insert</kbd> | take a screenshot of the selected area |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>s</kbd> | take a screenshot of the selected area |

<h3>Tag Keybinds</h3>

| <samp>Keybind</samp> | <samp>Action</samp> |
| ------- | ------ |
| <kbd>Super</kbd> + <kbd>[1-6]</kbd> | view tag |
| <kbd>Super</kbd> + <kbd>Control</kbd> + <kbd>[1-6]</kbd> | toggle tag |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>[1-6]</kbd> | move focused client to tag |
| <kbd>Super</kbd> + <kbd>Control</kbd> + <kbd>Shift</kbd> + <kbd>[1-6]</kbd> | toggle focused client on tag |


</details>

<h2>🧐 <samp>Showcase</samp></h2>

> ⚠️ &nbsp; <samp><b>i'll add this part later, sorry gamer but i don't have enough stuff to showcase yet lmao</b></samp> &nbsp; ⚠️ <br />
> <samp><b>check out this cool bar tho</b></samp><br />
> <img src="/.github/assets/bar.gif" alt="cool bar :DDD" />

<h2>🛠️ <samp>Install Guide</samp></h2>

<details>
<summary>1. Install required packages</summary>

   - For **Arch** <img src="https://upload.wikimedia.org/wikipedia/commons/a/a5/Archlinux-icon-crystal-64.svg" alt="arch linux" width="16" height="16"/> users:
     - *Assuming your AUR helper is* [`paru`](https://github.com/Morganamilo/paru)*, run:*
       ```
       paru -S awesome-git rofi pipewire pipewire-pulse wireplumber pamixer pulsemixer scrot xclip zsh neovim firefox pcmanfm-gtk3 ranger mailspring spotify feh nerd-fonts-jetbrains-mono ttf-twemoji yadm starship bat exa ncdu duf zsh-syntax-highlighting zsh-autosuggestions x11-emoji-picker-git
       ```
   - For **anyone else** <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/linux/linux-original.svg" alt="linux" width="16" height="16" />:
     - :warning: &nbsp; <samp><b>Sorry gamers, too lazy to look for packages on distros I don't use personally... Look for yourselves and maybe make an issue if you want me to add your fav distro and I'll think about it!</b></samp> &nbsp; :warning:

</details>
<details>
<summary>2. Pull the repo using <code><a href="https://github.com/TheLocehiliosan/yadm">yadm</a></code></summary>

   - Run:
     ```
     yadm clone https://github.com/Aproxia-dev/.dotfiles.git
     ```

</details>
<details>
<summary>3. Update the submodules</summary>
   
   - Run:
     ```
     yadm submodule update --remote --rebase
     ```
     - <samp><i>Keep in mind that you still need to run `make && sudo make install` in the `~/.local/src/st-flexipatch/` directory before st is going to work.</i></samp>
     - You should be able to log into awesome at this point.
     
</details>
<details>
<summary>4. Install some extra themes <sup>(Optional)</sup></summary>

   - If you wish to install an icon theme, a cursor theme and a GTK theme, run:
     ```
     paru -S catppuccin-gtk-theme-mocha lxappearance papirus-icon-theme unzip
     mkcd .local/src/catppuccin
     git clone https://github.com/catppuccin/cursors.git
     git clone https://github.com/catppuccin/papirus-folders.git
     cd cursors
     unzip Catppuccin-Mocha-Dark-Cursors.zip
     sudo mv Catppuccin-Mocha-Dark-Cursors /usr/share/icons/
     cd ../papirus-folders
     sudo cp -r src/* /usr/share/icons/Papirus
     ./papirus-folders -C cat-mocha-mauve --theme Papirus-Dark
     ```
   - Launch lxappearance and select the correct GTK theme, icon theme and cursor theme.
   
</details>
🎉 Tada! You have installed my dotfiles now! Enjoy!

<h2>💸 <samp><b>Donating</b></samp><img src="https://img.shields.io/static/v1?label=&message=PayPal&color=00457C&style=for-the-badge&logo=paypal&logoColor=ffffff" alt="PayPal" width=94 align=right /><img src="https://img.shields.io/static/v1?label=&message=Ko-fi&color=F16061&style=for-the-badge&logo=ko-fi&logoColor=ffffff" alt="Ko-fi" width=82 align=right /></h2>
<img src="https://img.shields.io/date/1673910000?label=%F0%9F%8E%82%20apro%27s%2018th%20bday&labelColor=1e1e2e&color=cba6f7&style=for-the-badge" align=right />
In case you wanna donate to me <sub><strike><i>(why the heck would you??)</i></strike></sub>, you're in bad luck.<br /><br />
I'm still not 18 so I can't make a <b>PayPal</b> or a <b>Ko-fi</b> or anything like that lmao 🤷‍♀️

<h2>🌟 <samp><b>Acknowledgements</b></samp></h2>

- Special thanks to:
  - [`Octelly`](https://github.com/Johnystar/) for helping me troubleshoot stuff whenever i was pulling a goofy
- Big kudos to all these people for being a great source inspiration and help:
  - [`rxyhn`](https://github.com/rxyhn/)
  - [`saimoomedits`](https://github.com/saimoomedits/)
  - [`ChocolateBread`](https://github.com/ChocolateBread799/)
  - [`elenapan`](https://github.com/elenapan/dotfiles/)
  - [`Crylia`](https://github.com/Crylia/)
  - [`JavaCafe`](https://github.com/JavaCafe01/)
- A fat thank you to these for providing feedback and more help:
  - [`r/unixp*rn Discord Server`](https://discord.gg/TnJ4h5K)
  - [`AwesomeWM Discord Server`](https://discord.gg/BPat4F87dg)
- And of course the credit also goes to all the contributors:
<div>
  <a href="https://github.com/Aproxia-dev/.dotfiles/graphs/contributors"><img src="https://contrib.rocks/image?repo=Aproxia-dev/.dotfiles"/></a>
</div>

<div align="center"><img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/footers/gray0_ctp_on_line.svg" /></div>
