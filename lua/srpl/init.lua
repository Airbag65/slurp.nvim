local popup = require("plenary.popup")

local M = {}

-- Hello

M.setup = function(opts)
end

M.command = ""

local Win_id

function ShowMenu()
    local width = 100
    local height = 1
    local borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }

    Win_id = popup.create({}, {
        title = "SRPL - Usage: '<search>/<replace>'",
        highlight = "SRPL",
        line = math.floor(((vim.o.lines - height) / 2) - 1),
        col = math.floor((vim.o.columns - width) / 2),
        minwidth = width,
        minheight = height,
        borderchars = borderchars,
        callback = (function(_, str)
            local something = vim.api.nvim_buf_get_lines(0, 0, 1, false)[1]
            M.command = string.format("%s/%s", "%s", something)
            -- print(M.command)
        end)
    })
    local bufnr = vim.api.nvim_win_get_buf(Win_id)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "q", "<cmd>lua CloseMenu()<CR>", { silent=false })
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<ESC>", "<cmd>lua CloseMenu()<CR>", { silent=false })
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<ENTER>", "<cmd>lua CloseMenu()<CR>", { silent=false })
    vim.api.nvim_buf_set_keymap(bufnr, "i", "<ENTER>", "<cmd>lua CloseMenu()<CR>", { silent=false })

end

function CloseMenu()
    local something = vim.api.nvim_buf_get_lines(0, 0, 1, false)[1]
    M.command = string.format("%s/%s", "%s", something)
    vim.api.nvim_win_close(Win_id, true)
    print(M.command)
    vim.cmd(M.command)
end

M.launch = function()
    ShowMenu()
end


return M
