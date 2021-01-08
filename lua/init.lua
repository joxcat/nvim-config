local nvim_lsp = require'lspconfig';
local home = os.getenv("HOME");

local on_attach = require'completion'.on_attach;

nvim_lsp.tsserver.setup{
    --on_attach=on_attach,
};
nvim_lsp.vuels.setup{
    --on_attach=on_attach,
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
    --on_attach=on_attach,
};

local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
  system_name = "Windows"
else
  print("Unsupported system for sumneko")
end
local sumneko_root_path = home.."/Applications/lua-language-server";
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server";
nvim_lsp.sumneko_lua.setup{
    --on_attach=on_attach,
    cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" };
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = vim.split(package.path, ';'),
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'},
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {
                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                },
            },
        },
    },
};
nvim_lsp.vimls.setup{
    --on_attach=on_attach,
};
nvim_lsp.nimls.setup{
    cmd = { home.."/.nimble/pkgs/nimlsp-0.2.6/nimlsp" },
    --on_attach=on_attach,
};

require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },
};
