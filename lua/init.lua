require'nvim_lsp'.tsserver.setup{};
require'nvim_lsp'.rust_analyzer.setup{};

require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },
};
