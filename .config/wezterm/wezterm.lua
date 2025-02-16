local Config = require("config")

require("config.envents").setup()

return Config:init()
  :append(require("config.general"))
  :append(require("config.bindings"))
  :append(require("config.launch")).options
