local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local make_entry = require "telescope.make_entry"
local conf = require("telescope.config").values

local M = {}

local live_multigrep = function(opts)
  opts = opts or {}
  opts.cwd = opts.cwd or vim.uv.cwd()

  local finder = finders.new_async_job {
    command_generator = function(prompt)
      if not prompt or prompt == "" then
        return nil
      end

      local pieces = vim.split(prompt, "  ")
      local search_text = vim.trim(pieces[1] or "")
      local path_filter = vim.trim(pieces[2] or "")

      if search_text == "" then
        return nil
      end

      local args = {
        "rg",
        "--color=never",
        "--no-heading",
        "--line-number",
        "--with-filename",
        "--column",
        "--smart-case",
        "-e", search_text,
      }

      if path_filter ~= "" then
        for _, pattern in ipairs(vim.split(path_filter, "%s+")) do
          if pattern ~= "" then
            table.insert(args, "-g")
            table.insert(args, "**/*" .. pattern .. "/**")

            table.insert(args, "-g")
            table.insert(args, "**/*" .. pattern .. "*")
          end
        end
      end

      print(vim.inspect(args))
      return args
    end,
    entry_maker = make_entry.gen_from_vimgrep(opts),
    cwd = opts.cwd,
  }

  pickers.new(opts, {
    debounce = 100,
    prompt_title = "Multi Grep",
    finder = finder,
    previewer = conf.grep_previewer(opts),
    sorter = require("telescope.sorters").empty(),
  }):find()
end

M.multigrep = live_multigrep

return M
