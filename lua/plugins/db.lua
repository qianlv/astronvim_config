return {
  {
    "kndndrj/nvim-dbee",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    build = function()
      -- Install tries to automatically detect the install method.
      -- if it fails, try calling it with one of these parameters:
      --    "curl", "wget", "bitsadmin", "go"
      require("dbee").install()
    end,
    config = function()
      local db = vim.fn.getcwd() .. "/.db.json"
      local f = io.open(db, "r")
      local config = {}
      if f ~= nil then
        io.close(f)
        config["sources"] = {
            require("dbee.sources").FileSource:new(db),
          }
      end
      require("dbee").setup(config)
    end,
  }
}
