-- Bootstrap lazy.nvim (plugin manager)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none", "--branch=stable",
    "https://github.com/folke/lazy.nvim.git", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.opt.number = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = false
vim.opt.cursorline = true

-- Folding: Treesitter-based, files open unfolded
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99

require("lazy").setup({
  { "nvim-treesitter/nvim-treesitter", branch = "main", build = ":TSUpdate",
    config = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
        callback = function() pcall(vim.treesitter.start) end,
      })
    end },
  { "neovim/nvim-lspconfig" },
  { "saghen/blink.cmp", version = "1.*", opts = {} },
})

-- TypeScript language server (needs: npm install -g typescript typescript-language-server)
vim.lsp.enable("ts_ls")

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local map = function(lhs, rhs)
      vim.keymap.set("n", lhs, rhs, { buffer = args.buf })
    end
    map("gd", vim.lsp.buf.definition)
    map("gr", vim.lsp.buf.references)
    map("K", vim.lsp.buf.hover)
    map("<leader>rn", vim.lsp.buf.rename)
    map("<leader>ca", vim.lsp.buf.code_action)
    map("<leader>d", vim.diagnostic.open_float)
  end,
})
vim.api.nvim_create_user_command("CD", function()
  vim.cmd("cd " .. vim.fn.expand("%:p:h"))
end, {})
vim.api.nvim_set_hl(0, 'Folded', { bg = '#000000', fg = '#FFAAFF' })
vim.api.nvim_set_hl(0, "@variable", { fg = "#9CDCFE" })
vim.api.nvim_set_hl(0, "@function", { fg = "#FFFF00" })
vim.api.nvim_set_hl(0, "@keyword", { fg = "#C586C0" })
vim.api.nvim_set_hl(0, "@constant", { fg = "#4FC1FF" })
vim.api.nvim_set_hl(0, "@type", { fg = "#4EC9B0" })
vim.api.nvim_set_hl(0, "NonText", { fg = "#FF88FF" })
vim.api.nvim_set_hl(0, "LineNr", { fg = "#AAAAAA" })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#FFFF80", bold = true, underline = true })
vim.opt.showbreak = "… "
