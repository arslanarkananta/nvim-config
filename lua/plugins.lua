return require('lazy').setup({
  { -- Bufferline for tabs
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require("config.bufferline")
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
      require("config.lualine")
    end
  },

  { -- Alpha for startup screen
    'goolord/alpha-nvim',
    config = function()
      require("config.alpha")
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
      require("config.neo-tree")
		end,
	},

  { -- Telescope for fuzzy finder
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make CC=gcc' },
      'nvim-telescope/telescope-file-browser.nvim',
    },
    config = function()
      require("config.telescope")
    end
  },

  { -- LSP for language support
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
    },
    config = function()
      require("config.lspconfig")
    end
  },

  { -- Cmp for autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      { "L3MON4D3/LuaSnip",
        build = "make CC=gcc",
        dependencies = { "rafamadriz/friendly-snippets" } },
      'saadparwaiz1/cmp_luasnip',
      'onsails/lspkind.nvim',
    },
    config = function()
      require("config.cmp")
    end
  },

  { -- Treesitter for syntax highlighting
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require("config.treesitter")
    end
  },

  { -- Wilder for wildmenu autocompletion
    "gelguy/wilder.nvim",
    lazy = false,
    config = function()
      require("config.wilder")
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
	{ 'dkarter/bullets.vim' },

	-- Vim-better-whitespace for :StripWhitespace and whitespace highlighting
	{ "ntpeters/vim-better-whitespace" },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("todo-comments").setup({})
		end
  },

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

  { -- Conform for code formatting
    "stevearc/conform.nvim",
    config = function()
      require("config.conform")
    end,
  },

  { -- Fugitive for git integration
    'tpope/vim-fugitive',
    config = function()
      require("config.fugitive")
    end
  },

  { -- Gitsigns to show git change (change, delete, add) signs in vim sign column
    "lewis6991/gitsigns.nvim",
    config = function()
      require("config.gitsigns")
    end,
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
    end,
  },

  { -- Markdown preview (activated by ":MarkdownPreview" command)
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    ft = { "markdown" },
    config = function()
      vim.g.mkdp_auto_start = 1
    end,
  },

  { -- UFO with statuscol for folding
    'kevinhwang91/nvim-ufo',
    dependencies = {
      'kevinhwang91/promise-async',
      'luukvbaal/statuscol.nvim',
    },
    config = function()
      require("config.nvim-ufo")
    end,
  },

  { -- Hop for faster navigation
    'phaazon/hop.nvim',
    branch = 'v2',
    config = function()
      require("config.hop")
    end,
  },

	{ -- Which-key for help with keybindings
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("config.which-key")
    end
  },

	{ -- Indent-blankline for indenting guide
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    main = "ibl",
    config = function()
      require("config.indent-blankline")
    end,
	},

	{ -- Persistence for automated session management
		"folke/persistence.nvim",
		event = "BufReadPre",
		config = function()
			require("config.persistence")
		end,
	},

  { -- Yanky for better yank and put commands
    "gbprod/yanky.nvim",
    event = "VeryLazy",
    config = function()
      require("config.yanky")
    end,
  },
})
