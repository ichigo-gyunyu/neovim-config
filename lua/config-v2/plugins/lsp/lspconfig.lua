return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "j-hui/fidget.nvim",
  },
  opts = {
    diagnostics = {
      virtual_text = false,
    },

    servers = {
      lua_ls = {
        settings = {
          Lua = {
            -- make the language server recognize "vim" global
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              checkThirdParty = false,
              library = {
                unpack(vim.api.nvim_get_runtime_file("", true)),
              },
            },
          },
        },
      },

      omnisharp = {
        enable_roslyn_analysers = true,
        enable_import_completion = true,
        organize_imports_on_format = true,
        enable_decompilation_support = true,
        filetypes = { "cs", "vb", "csproj", "sln", "slnx", "props", "csx", "targets" },
      },

      rust_analyzer = {},
    },
  },
  config = function(_, opts)
    local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
    local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      has_cmp and cmp_nvim_lsp.default_capabilities() or {}
    )

    local on_attach = function(client, bufnr)
      -- Setup keybinds
      local keymap_opts = {
        noremap = true,
        silent = true,
        buffer = bufnr,
        desc = "",
      }

      keymap_opts.desc = "Goto Definition"
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, keymap_opts)
      keymap_opts.desc = "Goto Declaration"
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, keymap_opts)
      keymap_opts.desc = "Hover"
      vim.keymap.set("n", "K", vim.lsp.buf.hover, keymap_opts)
      keymap_opts.desc = "Goto Implementation"
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, keymap_opts)
      keymap_opts.desc = "Goto Type Definition"
      vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, keymap_opts)
      keymap_opts.desc = "References"
      vim.keymap.set("n", "gr", vim.lsp.buf.references, keymap_opts)
      keymap_opts.desc = "Signature Help"
      vim.keymap.set("n", "gK", vim.lsp.buf.signature_help, keymap_opts)
      keymap_opts.desc = "Code Action"
      vim.keymap.set({ "n", "v" }, "<leader>.", vim.lsp.buf.code_action, keymap_opts)
      keymap_opts.desc = "Line Diagnostics"
      vim.keymap.set({ "n", "v" }, "gl", vim.diagnostic.open_float, keymap_opts)
      keymap_opts.desc = "Rename"
      vim.keymap.set({ "n", "v" }, "<leader>rn", vim.diagnostic.open_float, keymap_opts)

      -- Highlight references under cursor
      if client and client.server_capabilities.documentHighlightProvider then
        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
          buffer = bufnr,
          callback = vim.lsp.buf.document_highlight,
        })

        vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
          buffer = bufnr,
          callback = vim.lsp.buf.clear_references,
        })
      end
    end

    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

    local lspconfig = require("lspconfig")
    local servers = opts.servers
    for server, server_opts in pairs(servers) do
      server_opts = vim.tbl_deep_extend("force", {
        capabilities = capabilities,
        on_attach = on_attach,
      }, server_opts)

      lspconfig[server].setup(server_opts)
    end
  end,
}
