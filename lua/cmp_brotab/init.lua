local source = {}

source.new = function()
  return setmetatable({}, { __index = source })
end


---Return the debug name of this source. (Optional)
---@return string
function source:get_debug_name()
  return 'brotab'
end

function source:get_keyword_pattern()
  return [[\w\+]]
end

---Invoke completion. (Required)
---@param params cmp.SourceCompletionApiParams
---@param callback fun(response: lsp.CompletionResponse|nil)
function source:complete(params, callback)
  local bt_words = {}

  for line in io.popen("brotab words"):lines() do
    table.insert(bt_words, line)
  end

  if bt_words == nil then
    return callback()
  end

  local items = vim.tbl_map(function(w)
    return {
      word = w,
      label = w,
      labelDetails = {
        detail = "nope"
      },
    }
  end, bt_words)

  callback(items)
end

function source:get_trigger_characters()
  return { 'bt' }
end

function source:resolve(completion_item, callback)
  callback(completion_item)
end

---Execute command after item was accepted.
---@param completion_item lsp.CompletionItem
---@param callback fun(completion_item: lsp.CompletionItem|nil)
function source:execute(completion_item, callback)
  callback(completion_item)
end

---Register custom source to nvim-cmp.
-- This is done in after/plugin/cmp_brotab.lua
-- require('cmp').register_source('brotab', source.new())

return source
