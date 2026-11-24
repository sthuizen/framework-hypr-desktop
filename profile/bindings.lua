-- This file is loaded after Omarchy's helpers, with its built-in binding set off.
require("default.hypr.bindings.media")
o.bind("SUPER + RETURN", "Terminal", o.launch_terminal())
o.bind("SUPER + D", "Applications", "omarchy-shell omarchy.dock apps")
o.bind("SUPER + SHIFT + Q", "Close window", hl.dsp.window.close())
o.bind("SUPER + F", "Fullscreen", hl.dsp.window.fullscreen({ mode = "fullscreen" }))
o.bind("SUPER + SHIFT + SPACE", "Float or tile", hl.dsp.window.float({ action = "toggle" }))
o.bind("SUPER + ESCAPE", "System menu", { menu = "system" })
o.bind("SUPER + SHIFT + E", "Session actions", { menu = "system" })
o.bind("CTRL + ALT + L", "Lock", "omarchy-system-lock")
o.bind("PRINT", "Screenshot", "omarchy-capture-screenshot")
o.bind("SUPER + SHIFT + C", "Reload configuration", "hyprctl reload")
o.bind("SUPER + H", "Next window to the right", hl.dsp.layout("preselect r"))
o.bind("SUPER + V", "Next window below", hl.dsp.layout("preselect d"))
o.bind("SUPER + minus", "Show scratchpad", hl.dsp.workspace.toggle_special("scratchpad"))
o.bind("SUPER + SHIFT + minus", "Send to scratchpad", hl.dsp.window.move({ workspace = "special:scratchpad", follow = false }))
o.bind("SUPER + SHIFT + B", "Browser", { omarchy = "browser" })
o.bind("SUPER + SHIFT + N", "Editor", { omarchy = "editor" })
o.bind("SUPER + SHIFT + M", "Music", { tui = "cliamp" })
o.bind("SUPER + CTRL + RETURN", "Codex", { tui = "codex" })
for _, item in ipairs({{"J", "LEFT", "l"}, {"K", "DOWN", "d"}, {"L", "UP", "u"}, {"semicolon", "RIGHT", "r"}}) do
  for _, key in ipairs({item[1], item[2]}) do
    o.bind("SUPER + " .. key, "Focus " .. item[2], hl.dsp.focus({ direction = item[3] }))
    o.bind("SUPER + SHIFT + " .. key, "Move " .. item[2], hl.dsp.window.move({ direction = item[3] }))
  end
end
for workspace = 1, 10 do
  local key = "code:" .. tostring(workspace + 9)
  o.bind("SUPER + " .. key, "Workspace " .. workspace, o.workspaces.focus(workspace))
  o.bind("SUPER + SHIFT + " .. key, "Send to workspace " .. workspace, o.workspaces.move_window(workspace, false))
end
o.bind("SUPER + F1", "Finish setup", "finish-setup")
