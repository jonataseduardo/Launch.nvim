local M = {
  "hkupty/iron.nvim",
  lazy = false,
}

function M.config()
  local status_ok, iron = pcall(require, "iron.core")
  if not status_ok then
    return
  end
  iron.setup {
    config = {
      -- If iron should expose `<plug>(...)` mappings for the plugins
      should_map_plug = false,
      -- Whether a repl should be discarded or not
      scratch_repl = true,
      -- Automatically closes the repl window on process end
      close_window_on_exit = true,
      -- Your repl definitions come here
      repl_definition = {
        sh = {
          command = { "zsh" },
        },
        python = require("iron.fts.python").ipython,
      },
      repl_open_cmd = require("iron.view").bottom(40),
      -- how the REPL window will be opened, the default is opening
      -- a float window of height 40 at the bottom.
    },
    -- Iron doesn't set keymaps by default anymore. Set them here
    -- or use `should_map_plug = true` and map from you vim files
    keymaps = {
      send_motion = "<leader>sc",
      visual_send = "<leader>sc",
      send_file = "<leader>sf",
      send_line = "<leader>sl",
      send_until_cursor = "<leader>su",
      send_mark = "<leader>sm",
      mark_motion = "<leader>mc",
      mark_visual = "<leader>mc",
      remove_mark = "<leader>md",
      cr = "<leader>s<cr>",
      interrupt = "<leader>s<leader>",
      exit = "<leader>sq",
      clear = "<leader>cl",
    },
    -- If the highlight is on, you can change how it looks
    -- For the available options, check nvim_set_hl
    highlight = {
      italic = true,
    },
  }
end

return M
