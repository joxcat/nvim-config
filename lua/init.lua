local nvim_lsp = require'nvim_lsp';

local on_attach = function(client)
    require'completion'.on_attach(client)
    require'diagnostic'.on_attach(client)
end

nvim_lsp.tsserver.setup{
    on_attach=on_attach,
};
nvim_lsp.rust_analyzer.setup{
    cmd = { "/usr/local/bin/rust-analyser" },
    on_attach=on_attach,
};
nvim_lsp.sumneko_lua.setup{
    on_attach=on_attach,
};
nvim_lsp.vimls.setup{
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
