local M = {}

M.async = true

function M.async_create_popup(create_popup_callback, location_opts)
  location_opts = location_opts or {}

  require("snacks.picker").lsp_references({
    auto_confirm = true,
    confirm = function(picker, item)
      picker:close()
      if not item then return end
      create_popup_callback {
        target_bufnr = vim.uri_to_bufnr(item.loc.uri),
        lnum = item.pos[1],
        col = item.pos[2],
        title = item.file or "",
      }
    end,
  })
end

return M
