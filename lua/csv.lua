local api = vim.api

-- Function to split a string by a delimiter
local function split_str(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t = {}
    for str in string.gmatch(inputstr, "([^" .. sep .. "]*),?") do
        table.insert(t, str)
    end
    return t
end

-- Function to align text in CSV columns
local function align_csv_columns()
    local bufnr = api.nvim_get_current_buf()
    local ns_id = api.nvim_create_namespace("csv_align")
    local lines = api.nvim_buf_get_lines(bufnr, 0, -1, false)
    local max_lengths = {}
    api.nvim_buf_clear_namespace(bufnr, ns_id, 0, -1)

    -- Determine the maximum length of each column
    for _, line in ipairs(lines) do
        local cells = split_str(line, ',')
        for i, cell in ipairs(cells) do
            local len = #cell
            if not max_lengths[i] or len > max_lengths[i] then
                max_lengths[i] = len
            end
        end
    end

    -- Add virtual text to each column
    for row, line in ipairs(lines) do
        local cells = split_str(line, ',')
        local col_start = 0
        for i, cell in ipairs(cells) do
            local padding = string.rep(' ', max_lengths[i] - #cell)
            if #padding > 0 then
                local colst = col_start + #cell
                pcall(
                    function()
                        api.nvim_buf_set_extmark(bufnr, ns_id, row - 1, colst,
                            {
                                virt_text = { { padding, "Normal" } },
                                virt_text_pos = "inline"
                            }
                        )
                    end
                )
            end
            local col_end = col_start + max_lengths[i] - #padding
            col_start = col_end + 1 -- +1 for the comma separator
        end
    end
end

-- Create a command to run the function
api.nvim_create_user_command('AlignCSV', align_csv_columns, {})
