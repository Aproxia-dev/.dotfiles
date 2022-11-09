terminal = "st"
editor = os.getenv("EDITOR") or "nvim"
browser = "firefox"
mail = "mailspring"
files = "pcmanfm"
termfiles = "ranger"
music = "spotify"
emoji_picker = "emoji-picker"

editor_cmd = terminal .. " -e " .. editor
termfiles_cmd = terminal .. " -e " .. termfiles

laptop = true
