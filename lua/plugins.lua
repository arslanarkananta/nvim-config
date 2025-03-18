return require('lazy').setup({
  { -- Bufferline for tabs
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require("bufferline").setup {
        options = {
          mode = "tabs",
          separator_style = "slant",
          always_show_bufferline = true,
          show_buffer_close_icons = true,
          show_close_icon = true,
          color_icons = true,
          diagnostics = "nvim_lsp",
          diagnostics_indicator = function(count, level)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
          end,
          custom_filter = function(buf_number)
            if vim.bo[buf_number].filetype ~= "qf" then
              return true
            end
          end,
          offsets = {
            {
              filetype = "NvimTree",
              text = "File Explorer",
              highlight = "Directory",
              text_align = "left",
              padding = 1
            }
          },
          hover = {
            enabled = true,
            delay = 200,
            reveal = {'close'}
          },
        },
      }

      -- Bufferline keymaps
      vim.keymap.set('n', '<C-Tab>', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
      vim.keymap.set('n', '<C-S-Tab>', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
			vim.keymap.set('n', '<C-t>', ':tabnew<CR>', { noremap = true, silent = true })

      -- Hide tabline when alpha is open
			vim.api.nvim_create_autocmd("User", {
        pattern = "AlphaReady",
        callback = function()
          vim.opt.showtabline = 0
				end
      })

      -- Show tabline when alpha is closed
      vim.api.nvim_create_autocmd("BufUnload", {
        pattern = "<buffer>",
        callback = function()
          vim.opt.showtabline = 2
        end
      })
    end
  },

  { -- Miasma for theme
    "xero/miasma.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme miasma")
    end,
  },

  { -- Lualine for statusline
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'auto',
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
					disabled_filetypes = { 'alpha' },
        }
      }
    end
  },

  { -- Alpha for startup screen
    'goolord/alpha-nvim',
    config = function()
      local dashboard = require("alpha.themes.dashboard")
      dashboard.section.header.val = {
				"", "", "", "", "",
				"                                                                     ",
				"       ████ ██████           █████      ██                     ",
				"      ███████████             █████                             ",
				"      █████████ ███████████████████ ███   ███████████   ",
				"     █████████  ███    █████████████ █████ ██████████████   ",
				"    █████████ ██████████ █████████ █████ █████ ████ █████   ",
				"  ███████████ ███    ███ █████████ █████ █████ ████ █████  ",
				" ██████  █████████████████████ ████ █████ █████ ████ ██████ ",
				"", "", "", "", "",
			}

      dashboard.section.buttons.val = {
        dashboard.button("r", "⌛  Recent files", ":Telescope oldfiles<CR>"),
        dashboard.button("f", "🔎  Find file", ":Telescope find_files<CR>"),
        dashboard.button("g", "🔍  Find text", ":Telescope live_grep<CR>"),
        dashboard.button("c", "🔧  Configuration", ":e $MYVIMRC<CR>"),
        dashboard.button("q", "🚪  Quit", ":qa<CR>"),
      }

      local function get_plugin_count()
        return require("lazy").stats().count
      end

      local startup_time = vim.fn.reltimefloat(vim.fn.reltime(vim.g.start_time or vim.fn.reltime()))
      local startup_time_ms = math.floor(startup_time * 1000)

      dashboard.section.footer.val = {
        "",
        "Neovim loaded " .. get_plugin_count() .. " plugins in " .. startup_time_ms .. " ms",
        "",
      }

      require('alpha').setup(dashboard.opts)
    end
  },

	{ -- NeoTree for file explorer
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
	  dependencies = {
		  "nvim-lua/plenary.nvim",
	    "nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
	  config = function()
			require("neo-tree").setup({
        filesystem = {
          filtered_items = {
            visible = true,
            hide_dotfiles = false,
          },
          follow_current_file = {
						enabled = true,
					},
          hijack_netrw = true,
        },
      })
      vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { noremap = true, silent = true })
		end,
	},

  { -- Telescope for fuzzy finder
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' },
      'nvim-telescope/telescope-file-browser.nvim',
    },
    config = function()
      require('telescope').setup({
        defaults = {
          file_ignore_patterns = {".git/", "node_modules/", "%.log"},
          prompt_prefix = "🔍 ",
          color_devicons = true,
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
          },
        }
      })
      require('telescope').load_extension('fzf')
      require('telescope').load_extension('file_browser')

      local telescope = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', telescope.find_files, { desc = "Find files" })
      vim.keymap.set('n', '<leader>fg', telescope.live_grep, { desc = "Live grep" })
      vim.keymap.set('n', '<leader>fb', function() require('telescope').extensions.file_browser.file_browser() end, { desc = "File browser" })
      vim.keymap.set('n', '<leader>fr', telescope.oldfiles, { desc = "Recent files" })
    end
  },

  { -- LSP for language support
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
    },
    config = function()
      require('mason').setup()
      require('mason-lspconfig').setup({
        ensure_installed = { "lua_ls", "pyright", "ts_ls", "clangd" },
        automatic_installation = true,
      })

      local lspconfig = require('lspconfig')

      local on_attach = function(client, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, opts)
      end

      -- Lua LS
      lspconfig.lua_ls.setup({
        on_attach = on_attach,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })

      -- Python ls (pyright)
      lspconfig.pyright.setup({
        on_attach = on_attach,
      })

      -- Typescript ls
      lspconfig.ts_ls.setup({
        on_attach = on_attach,
      })

      -- C/C++ ls (clangd)
      lspconfig.clangd.setup({
        on_attach = on_attach,
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
        },
      })

      -- See available language servers by going to
      -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
    end
  },

  { -- Cmp for autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'onsails/lspkind.nvim',
    },
    config = function()
      local cmp = require('cmp')
      local lspkind = require('lspkind')
      local luasnip = require('luasnip')

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-k>'] = cmp.mapping.select_prev_item(),
          ['<C-j>'] = cmp.mapping.select_next_item(),
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'buffer' },
          { name = 'path' },
        }),
        formatting = {
          format = lspkind.cmp_format({
            mode = 'symbol_text',
            maxwidth = 50,
            ellipsis_char = '...',
          }),
        },
        window = {
            documentation = {
            border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
            winhighlight = "Normal:CmpDocumentation,FloatBorder:CmpDocumentationBorder",
            max_width = 80,
            max_height = 20,
          },
          completion = {
            border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
            winhighlight = "Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel",
          },
        },
      })

      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' },
          { name = 'cmdline' },
        }),
      })

      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' },
        },
      })
    end
  },

  { -- Treesitter for syntax highlighting
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = { "c", "lua", "python", "javascript", "typescript", "rust", "markdown" },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true,
        },
      })
    end
  },

  { -- Wilder for wildmenu autocompletion
    "gelguy/wilder.nvim",
    lazy = false,
    config = function()
      local wilder = require("wilder")

      wilder.setup({ modes = { ":", "/", "?" } })

			wilder.set_option("renderer", wilder.popupmenu_renderer(
        wilder.popupmenu_border_theme({
          highlights = {
            border = "Normal",
					},
          border = "rounded",
        })
      ))
    end,
  },

  { -- Markdown highlighting
    'preservim/vim-markdown',
    ft = "markdown",
  },

	{ -- Better escape for faster exiting insert mode (jj/jk)
		"max397574/better-escape.nvim",
		config = function()
			require("better_escape").setup ()
		end,
	},

  { -- Better commenting
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  },

	{ -- Pairing brackets/parens/quotes
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({})
		end
	},

  -- Bullets for creating bulleted lists
	'dkarter/bullets.vim',

  { -- Undo Tree
    'mbbill/undotree',
    config = function()
      vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = "Toggle Undotree" })
    end
  },

	{ -- Vista for tag exploration
    'liuchengxu/vista.vim',
    config = function()
      vim.g.vista_default_executive = 'ctags'
      vim.g.vista_echo_cursor_strategy = 'floating_win'
      vim.keymap.set('n', '<leader>v', ':Vista!!<CR>', { noremap = true, silent = true })
    end
  },

  { -- Gutentags for code indexing
    'ludovicchabant/vim-gutentags',
    config = function()
      vim.g.gutentags_cache_dir = vim.fn.stdpath('data') .. '/tags'
      vim.g.gutentags_ctags_tagfile = '.tags'
    end
  },

  { -- Neoformat for code formatting
    'sbdchd/neoformat',
    config = function()
      vim.g.neoformat_enabled_python = {'black'}
      vim.g.neoformat_enabled_javascript = {'prettier'}
      vim.g.neoformat_enabled_lua = {'stylua'}
      vim.keymap.set('n', '<leader>nf', ':Neoformat<CR>', { noremap = true, silent = true })
    end
  },

  { -- Fugitive for git integration
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set('n', '<leader>gs', ':Git<CR>', { noremap = true, silent = true })
      vim.keymap.set('n', '<leader>gc', ':Git commit<CR>', { noremap = true, silent = true })
      vim.keymap.set('n', '<leader>gp', ':Git push<CR>', { noremap = true, silent = true })
    end
  },

	{ -- Notify for GUI notifications
    "rcarriga/nvim-notify",
    config = function()
      local notify = require("notify")
      notify.setup({
        background_colour = "#000000",
        render = "default",
				stages = "fade_in_slide_out",
        timeout = 3000,
      })

			vim.notify = notify
    end
  },

  { -- Markdown preview (activated by ":MarkdownPreview" command)
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    ft = { "markdown" },
    config = function()
      vim.g.mkdp_auto_start = 1
    end
  },

  { -- UFO with statuscol for folding
    'kevinhwang91/nvim-ufo',
    dependencies = {
      'kevinhwang91/promise-async',
      'luukvbaal/statuscol.nvim',
    },
    config = function()
      local builtin = require("statuscol.builtin")
      require("statuscol").setup({
        relculright = true,
        segments = {
          { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
          { text = { "%s" }, click = "v:lua.ScSa" },
          { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
        },
      })

      require('ufo').setup({
        provider_selector = function()
          return { 'treesitter', 'indent' }
        end,
        fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
          local newVirtText = {}
          local suffix = (' 󰁂 %d lines'):format(endLnum - lnum)
          local sufWidth = vim.fn.strdisplaywidth(suffix)
          local targetWidth = width - sufWidth
          local curWidth = 0
          for _, chunk in ipairs(virtText) do
            local chunkText = chunk[1]
            local chunkWidth = vim.fn.strdisplaywidth(chunkText)
            if targetWidth > curWidth + chunkWidth then
              table.insert(newVirtText, chunk)
            else
              chunkText = truncate(chunkText, targetWidth - curWidth)
              local hlGroup = chunk[2]
              table.insert(newVirtText, { chunkText, hlGroup })
              chunkWidth = vim.fn.strdisplaywidth(chunkText)

              if curWidth + chunkWidth < targetWidth then
                suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
              end
              break
            end
            curWidth = curWidth + chunkWidth
          end
          table.insert(newVirtText, { suffix, 'MoreMsg' })
          return newVirtText
        end
      })

      vim.keymap.set('n', 'zR', require('ufo').openAllFolds, { noremap = true, silent = true })
      vim.keymap.set('n', 'zM', require('ufo').closeAllFolds, { noremap = true, silent = true })
      vim.keymap.set('n', 'zr', require('ufo').openFoldsExceptKinds, { noremap = true, silent = true })
      vim.keymap.set('n', 'zm', require('ufo').closeFoldsWith, { noremap = true, silent = true })
      vim.keymap.set('n', 'zK', function()
        local winid = require('ufo').peekFoldedLinesUnderCursor()
        if not winid then
          vim.lsp.buf.hover()
        end
      end, { desc = "Peek folded code", noremap = true, silent = true })
    end
  },

  { -- Hop for faster navigation
    'phaazon/hop.nvim',
    branch = 'v2',
    config = function()
      require('hop').setup({
        keys = 'etovxqpdygfblzhckisuran',
        jump_on_sole_occurrence = true,
        case_insensitive = true,
      })

      local hop = require('hop')
      local directions = require('hop.hint').HintDirection

      vim.keymap.set('n', '<leader>hw', function()
        hop.hint_words()
      end, { desc = "Hop to word" })

      vim.keymap.set('n', '<leader>hl', function()
        hop.hint_lines()
      end, { desc = "Hop to line" })

      vim.keymap.set('n', '<leader>hc', function()
        hop.hint_char1()
      end, { desc = "Hop to character" })

      vim.keymap.set('n', '<leader>hp', function()
        hop.hint_patterns()
      end, { desc = "Hop to pattern" })

      vim.keymap.set('n', 'f', function()
        hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
      end, { remap = true })

      vim.keymap.set('n', 'F', function()
        hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
      end, { remap = true })

      vim.keymap.set('n', 't', function()
        hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
      end, { remap = true })

      vim.keymap.set('n', 'T', function()
        hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
      end, { remap = true })
    end
  },

	{ -- Which-key for help with keybindings
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300

      local wk = require("which-key")
      wk.setup({
        plugins = {
          marks = true,
          registers = true,
          spelling = {
            enabled = false,
          },
          presets = {
            operators = true,
            motions = true,
            text_objects = true,
            windows = true,
            nav = true,
            z = true,
            g = true,
          },
        },
        win = {
          border = "rounded",
          padding = { 2, 2, 2, 2 },
        },
        layout = {
          height = { min = 4, max = 25 },
          width = { min = 20, max = 50 },
          spacing = 3,
          align = "center",
        },
        filter = function()
          return true
        end,
        show_help = true,
      })
    end
  }
})
