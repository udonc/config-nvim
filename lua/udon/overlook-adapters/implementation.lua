local M = {}

M.async = true

function M.async_create_popup(create_popup_callback, location_opts)
  location_opts = location_opts or {}

  vim.lsp.buf.implementation {
    on_list = function(tt)
      local item = tt.items[1]
      if not item then
        vim.notify("Overlook: No implementation found", vim.log.levels.WARN)
        return
      end
      local uri = item.user_data and (item.user_data.targetUri or item.user_data.uri)
      if not uri then
        local bufnr = item.bufnr or (item.filename and vim.fn.bufadd(item.filename))
        if not bufnr then
          vim.notify("Overlook: No URI found in LSP implementation item", vim.log.levels.WARN)
          return
        end
        create_popup_callback {
          target_bufnr = bufnr,
          lnum = item.lnum,
          col = item.col,
          title = item.filename or "",
        }
        return
      end

      create_popup_callback {
        target_bufnr = vim.uri_to_bufnr(uri),
        lnum = item.lnum,
        col = item.col,
        title = item.filename,
      }
    end,
  }
end

return M
