vim.api.nvim_create_user_command(
    "Slurp",
    function()
        require("slurp").launch()
    end,
    {nargs = 0, bar = true }
)
