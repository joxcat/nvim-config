local nvim_lsp = require'lspconfig';

local on_attach = require'completion'.on_attach;

nvim_lsp.tsserver.setup{
    on_attach=on_attach,
};
nvim_lsp.vuels.setup{
    on_attach=on_attach,
    init_options={
        config={
            vetur={
                format={
                    options={
                        tabSize=2
                    }
                }
            }
        }
    }
};
nvim_lsp.rust_analyzer.setup{
    cmd = { "/usr/local/bin/rust-analyser" },
    on_attach=on_attach,
};
--nvim_lsp.sumneko_lua.setup{
    --on_attach=on_attach,
--};
nvim_lsp.vimls.setup{
    on_attach=on_attach,
};
nvim_lsp.nimls.setup{
    cmd = { "/Users/johan/.nimble/pkgs/nimlsp-0.2.6/nimlsp" },
    on_attach=on_attach,
};

require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },
};
