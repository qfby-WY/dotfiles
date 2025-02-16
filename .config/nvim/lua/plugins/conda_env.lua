return {
  "linux-cultist/venv-selector.nvim",
  enabled = false,
  opts = {
    settings = {
      search = {
        miniconda_envs = {
          command = "$FD python.exe$ D:/Miniconda3/envs --full-path -a -E Lib",
          type = "anaconda",
        },
        miniconda_base = {
          command = "$FD Miniconda3\\\\python.exe$ D:/Miniconda3 --full-path -a"
            .. " --max-depth 1 --color never",
          type = "anaconda",
        },
      },
    },
  },
}
