terminal = "kitty"
editor = os.getenv("EDITOR") or "nvim"
browser = "firefox"
mail = "mailspring"
files = "pcmanfm"
termfiles = "ranger"
music = "spotify"

editor_cmd = terminal .. " -e " .. editor
termfiles_cmd = terminal .. " -e " .. termfiles

theme = "catppuccin"

require("themes")
