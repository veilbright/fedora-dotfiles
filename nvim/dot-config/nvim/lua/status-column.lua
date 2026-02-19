local DEFAULT_LABELS = {
  "1",
  "2",
  "3",
  "4",
  "5",
  "11",
  "12",
  "13",
  "14",
  "15",
  "21",
  "22",
  "23",
  "24",
  "25",
  "31",
  "32",
  "33",
  "34",
  "35",
  "41",
  "42",
  "43",
  "44",
  "45",
  "51",
  "52",
  "53",
  "54",
  "55",
  "56",
  "57",
  "58",
  "59",
  "60",
  "61",
  "62",
  "63",
  "64",
  "65",
  "66",
  "67",
  "68",
  "69",
  "70",
  "71",
  "72",
  "73",
  "74",
  "75",
  "76",
  "77",
  "78",
  "79",
  "80",
  "81",
  "82",
  "83",
  "84",
  "85",
  "86",
  "87",
  "88",
  "89",
  "90",
  "91",
  "92",
  "93",
  "94",
  "95",
  "96",
  "97",
  "98",
  "99",
}

local M = {
  config = {
    labels = DEFAULT_LABELS,
    up_key = "k",
    down_key = "j",
    hidden_file_types = { "undotree" },
    hidden_buffer_types = { "terminal", "nofile", "prompt" },
  },
}

local should_hide_numbers = function(filetype, buftype)
  return vim.tbl_contains(M.config.hidden_file_types, filetype)
      or vim.tbl_contains(M.config.hidden_buffer_types, buftype)
end

-- Defined on the global namespace to be used in Vimscript below.
_G.get_label = function(absnum, relnum)
  -- Use numberwidth for consistent padding (set in update_status_column)
  local width = vim.wo.numberwidth

  -- Check if relativenumber is enabled (respects nvim-numbertoggle)
  if not vim.wo.relativenumber then
    return string.format("%" .. width .. "d", absnum)
  end

  if relnum == 0 then
    -- Pad current line number to match width
    return string.format("%-" .. width - 1 .. "d", vim.fn.line("."))
  elseif relnum > 0 and relnum <= #M.config.labels then
    -- Pad label to consistent width
    return string.format("%" .. width .. "s", M.config.labels[relnum])
  else
    -- Pad absolute number to consistent width
    return string.format("%" .. width .. "d", absnum)
  end
end

local function update_status_column()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    local buftype = vim.bo[buf].buftype
    local filetype = vim.bo[buf].filetype

    if should_hide_numbers(filetype, buftype) then
      vim.api.nvim_win_call(win, function()
        vim.opt.statuscolumn = ""
      end)
    else
      vim.api.nvim_win_call(win, function()
        -- Calculate and set consistent width based on total lines
        -- Minimum 4 to fit longest custom labels (e.g., "1444")
        local total_lines = vim.api.nvim_buf_line_count(buf)
        local width = math.max(4, #tostring(total_lines))
        vim.wo[win].numberwidth = width

        vim.opt.statuscolumn = '%=%s%=%{v:virtnum > 0 ? "" : v:lua.get_label(v:lnum, v:relnum)} '
      end)
    end
  end
end

function M.enable_line_numbers()
  for index, label in ipairs(M.config.labels) do
    vim.keymap.set({ "n", "v", "o" }, label .. M.config.up_key, index .. "k", { noremap = true })
    vim.keymap.set({ "n", "v", "o" }, label .. M.config.down_key, index .. "j", { noremap = true })
  end

  update_status_column()
end

local function create_auto_commands()
  local group = vim.api.nvim_create_augroup("ComfyLineNumbers", { clear = true })

  vim.api.nvim_create_autocmd(
    { "WinNew", "BufWinEnter", "BufEnter", "TermOpen", "InsertEnter", "InsertLeave", "FileType" },
    {
      group = group,
      pattern = "*",
      callback = update_status_column,
    }
  )
end

create_auto_commands()
M.enable_line_numbers()
