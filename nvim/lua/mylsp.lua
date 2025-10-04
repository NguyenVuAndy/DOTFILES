-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local opts = { noremap=true, silent=true, buffer=bufnr }

  -- Enable completion triggered by <c-x><c-o>
  vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

  -- Keymaps
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', 's', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('i', ',s', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', ',wa', vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set('n', ',wr', vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set('n', ',wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts)
  vim.keymap.set('n', ',D', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', ',rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', ',qf', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', ',f', function()
    vim.lsp.buf.format { async = true }
  end, opts)
end

-- global diagnostic settings
vim.diagnostic.config({
  virtual_text = true,  -- inline errors
  signs = true,         -- gutter symbols
  underline = true,     -- underline problem text
  update_in_insert = false, -- don’t spam while typing
  severity_sort = true,
})


-- capabilities
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- clangd config
vim.lsp.config("clangd", {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {
    "clangd",
    "--background-index",
    "--pch-storage=memory",
    "--clang-tidy",
    "--suggest-missing-includes",
    "--all-scopes-completion",
    "--pretty",
    "--header-insertion=never",
    "-j=4",
    "--inlay-hints",
    "--header-insertion-decorators",
  },
  filetypes = { "c", "cpp", "objc", "objcpp" },
  init_option = { fallbackFlags = { "-std=c++2a" } },
})

-- pyright config
vim.lsp.config("pyright", {
  on_attach = on_attach,
  capabilities = capabilities,
})

-- java config (using jdtls)
local home = os.getenv("HOME")
local jdtls_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls" -- if installed via mason
local workspace_dir = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

vim.lsp.config("jdtls", {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {
    "jdtls",
    "-data", workspace_dir,
  },
  filetypes = { "java" },
  root_markers = { "gradlew", "mvnw", ".git" },
})

-- enable all
vim.lsp.enable({ "clangd", "pyright", "jdtls" })

