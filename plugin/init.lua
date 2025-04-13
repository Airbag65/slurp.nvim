vim.api.nvim_create_user_command(
    "Srpl",
    function()
        require("srpl").launch()
    end,
    {nargs = 0, bar = true }
)
