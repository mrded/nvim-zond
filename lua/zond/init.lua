local function find_and_run(props)
  local actions = require "telescope.actions"
  local action_state = require "telescope.actions.state"

  local theme_opts = require('telescope.themes').get_dropdown({
      prompt_title = props.title,
      previewer = false 
    })
  
  local opts = { 
    search_file = props.filter,
    attach_mappings = function (prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        local cmd = string.format(props.cmd, selection[1])

        vim.cmd(cmd)
      end)
      return true
    end
  }

  local combined_opts = vim.tbl_extend("force", theme_opts, opts)

  require('telescope.builtin').find_files(combined_opts)
end


return {
  find_and_run = find_and_run,
}
