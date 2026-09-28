-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

-- To disable every Omarchy default binding, set this in
-- ~/.config/hypr/hyprland.lua before require("default.hypr.omarchy"), then add
-- only the bindings you want below:
--   omarchy_default_bindings = false

-- To disable all preinstalled app/webapp bindings, set:
--   omarchy_preinstalled_bindings = false

-- Add a new binding.
-- o.bind("SUPER + SHIFT + R", "SSH", "alacritty -e ssh your-server")

-- Change an existing binding by unbinding it first, then binding the key again.
-- This example changes SUPER+SPACE from the launcher to the Omarchy root menu.
-- hl.unbind("SUPER + SPACE")
-- o.bind("SUPER + SPACE", "Omarchy menu", "omarchy-menu toggle root")

-- Disable a default binding without replacing it.
-- hl.unbind("SUPER + SHIFT + B")

-- Logitech MX Keys examples:
-- o.bind("SUPER + SHIFT + S", nil, "omarchy-capture-screenshot")
-- o.bind("SUPER + H", nil, "voxtype record toggle")
-- o.bind("SUPER + PERIOD", nil, "omarchy-shell shell toggle omarchy.emojis")

---
hl.unbind("SUPER + W")
o.bind("SUPER + Q", "Kill window", hl.dsp.window.close())

hl.unbind("SUPER + F")
hl.unbind("SUPER + ALT + F")
o.bind("SUPER + ALT + F", "Full Screen", hl.dsp.window.fullscreen({ mode = "fullscreen" }))

o.bind("SUPER + F", "Full Width", hl.dsp.window.fullscreen({ mode = "maximized" }))

hl.unbind("SUPER + SHIFT + F")
o.bind("SUPER + E", "File manager", { launch= "flea --gui" })

hl.unbind("SUPER + P")
o.bind("SUPER + P", "Clipboard manager", "omarchy-shell shell toggle omarchy.clipboard")

hl.unbind("SUPER + CTRL + V")

-- Capture shortcuts (replace the default Print-key bindings)
hl.unbind("PRINT")
hl.unbind("ALT + PRINT")
hl.unbind("SUPER + PRINT")
hl.unbind("SUPER + CTRL + PRINT")

-- These keys are used by default for Maps, Calendar, and optionally Obsidian.
hl.unbind("SUPER + SHIFT + S")
hl.unbind("SUPER + SHIFT + C")
hl.unbind("SUPER + SHIFT + O")

o.bind("SUPER + SHIFT + S", "Screenshot", "omarchy-capture-screenshot")
o.bind("SUPER + SHIFT + R", "Screenrecording", "omarchy-capture-screenrecording --stop-recording || omarchy-menu toggle trigger.capture.screenrecord")
o.bind("SUPER + SHIFT + C", "Color picker", "pkill hyprpicker || hyprpicker -a")
o.bind("SUPER + SHIFT + O", "Extract text (OCR)", "omarchy-capture-text")

hl.unbind("SUPER + ALT + SHIFT + F")
o.bind("SUPER + ALT + SHIFT + F", "File manager (cwd)", { launch = 'flea --gui "$(omarchy-cmd-terminal-cwd)"' })

o.window("com.thisisgm.flea.picker", { tag = "+floating-window" })
