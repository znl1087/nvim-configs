-- 定义一个函数来处理选中的文本
function FormatJsonWithPython()
    -- 获取选中的文本范围
    local start = vim.fn.getpos("'<")
    local end_pos = vim.fn.getpos("'>")
    -- 获取选中的文本
    local lines = vim.fn.getline(start[2], end_pos[2])
    -- 将选中的文本通过 python 处理
    local formatted = vim.fn.system('python -m json.tool --no-ensure-ascii', table.concat(lines, "\n"))
    if vim.v.shell_error == 0 then
        -- 替换选中的文本
        vim.fn.setline(start[2], vim.fn.split(formatted, "\n"))
    else
        -- 输出错误信息，不替换文本
        vim.api.nvim_err_writeln("Error: Invalid JSON format.")
    end
end

-- 创建一个命令来调用上述函数
vim.api.nvim_create_user_command('FormatJson', FormatJsonWithPython, { range = true })
