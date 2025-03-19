local platform = require("utils.platform")
local home_path = platform.is_win and os.getenv("USERPROFILE") or os.getenv("HOME")

local options = {
  default_prog = {},
  launch_menu = {},
}

if platform.is_win then
  options.default_prog = { "pwsh", "-NoLogo" }
  options.launch_menu = {
    { label = "PWSH", args = { "pwsh.exe", "-NoLogo" }, cwd = home_path },
    {
      label = "Miniconda3",
      args = {
        "pwsh.exe",
        "-ExecutionPolicy",
        "ByPass",
        "-NoExit",
        "-Command",
        [[& 'D:\\Miniconda3\\shell\\condabin\\conda-hook.ps1' ; conda activate 'D:\\Miniconda3']],
      },
      cwd = "D:\\Miniconda3",
    },
    {
      label = "UCRT64/MSYS2",
      args = {
        "D:\\msys64\\msys2_shell.cmd",
        "-defterm",
        "-here",
        "-no-start",
        "-ucrt64",
        "-shell",
        "fish",
      },
      cwd = "D:\\msys64\\home\\CATWY",
    },
  }
elseif platform.is_linux then
  options.default_prog = { "zsh", "-l" }
  options.launch_menu = {
    { label = "Bash", args = { "bash", "-l" }, cwd = home_path },
    { label = "Zsh", args = { "zsh", "-l" }, cwd = home_path },
  }
end

return options
