local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

local function find_and_run(opts)
  opts = opts or {}

  local telescope_opts = require('telescope.themes').get_dropdown({
    prompt_title = opts.title or "Zond",
    previewer = false
  })

  if opts.filter then
    telescope_opts["search_file"] = opts.filter
  end

  telescope_opts["attach_mappings"] = function(prompt_bufnr)
    actions.select_default:replace(function()
      actions.close(prompt_bufnr)

      local selection = action_state.get_selected_entry()
      local cmd = string.format(opts.cmd, selection[1])

      vim.cmd(cmd)
    end)

    return true
  end

  require('telescope.builtin').find_files(telescope_opts)
end

return {
  find_and_run = find_and_run,
}
