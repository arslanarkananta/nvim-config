# Arslan's Neovim Config
<p>
    <a>
      <img alt="Linux" src="https://img.shields.io/badge/Linux-%23.svg?style=flat-square&logo=linux&color=FCC624&logoColor=black" />
    </a>
    <a>
      <img alt="macOS" src="https://img.shields.io/badge/macOS-%23.svg?style=flat-square&logo=apple&color=000000&logoColor=white" />
    </a>
    <a>
      <img alt="Windows" src="https://img.shields.io/badge/Windows-%23.svg?style=flat-square&logo=windows&color=0078D6&logoColor=white" />
    </a>
    <a href="https://github.com/neovim/neovim/releases/tag/stable">
      <img src="https://img.shields.io/badge/Neovim-0.10.4-blueviolet.svg?style=flat-square&logo=Neovim&logoColor=green" alt="Neovim minimum version"/>
    </a>
    <a>
      <img src="https://img.shields.io/github/languages/top/arslanarkananta/nvim-config" alt="Top languages"/>
    </a>
</p>
This repo contains my Neovim configuration for Linux, MacOS, and Windows.

## Screenshot

<p align="center">
    <img src="https://github.com/user-attachments/assets/c2dcaf28-16f7-4886-a9d1-9e2f912d5935" width="800">
</p>

## Installation

### 1. Backup existing config
```shell
# On Linux/MacOS
mv ~/.config/nvim ~/.config/nvim.backup

# On Windows
move $HOME\AppData\Local\nvim $HOME\AppData\Local\nvim-backup
```

### 2. Clone the repository
```shell
# On Linux/MacOS
git clone https://github.com/ttys3/nvim-config.git $HOME/.config/nvim

# On Windows
git clone https://github.com/ttys3/nvim-config.git $HOME\AppData\Local\nvim
```

## Features
+ Package management via [Lazy.nvim](https://github.com/folke/lazy.nvim).
+ Language server protocol (LSP) support via [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
+ Code, word, and snippet auto-completion via [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
+ Syntax highlighting and parsing via [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter).  
+ Enhanced command-line completion via [wilder.nvim](https://github.com/gelguy/wilder.nvim).  
+ File explorer and tree view via [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim).  
+ Fuzzy finding and file searching via [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim).
+ Git integration and signs via [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim).
+ Git commands and workflow integration via [vim-fugitive](https://github.com/tpope/vim-fugitive).
+ Markdown syntax support via [vim-markdown](https://github.com/preservim/vim-markdown).
+ Live Markdown preview via [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim).
+ Fold management with better UI via [nvim-ufo](https://github.com/kevinhwang91/nvim-ufo) and [statuscol.nvim](https://github.com/luukvbaal/statuscol.nvim).
+ Neovim startup screen via [alpha-nvim](https://github.com/goolord/alpha-nvim).
+ Buffer tabline enhancement via [bufferline.nvim](https://github.com/akinsho/bufferline.nvim).  
+ Statusline customization via [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim).
+ Tag viewer and outline via [vista.vim](https://github.com/liuchengxu/vista.vim).  
+ Automatic tag management via [vim-gutentags](https://github.com/ludovicchabant/vim-gutentags).  
+ Code commenting and toggling via [Comment.nvim](https://github.com/numToStr/Comment.nvim).
+ Surround text objects manipulation via [vim-surround](https://github.com/tpope/vim-surround).  
+ Bullet point management for lists via [bullets.vim](https://github.com/dkarter/bullets.vim).
+ Code formatting via [neoformat](https://github.com/sbdchd/neoformat).    
+ Faster key sequence escaping via [better-escape.nvim](https://github.com/max397574/better-escape.nvim).  
+ Notification and alert system via [nvim-notify](https://github.com/rcarriga/nvim-notify).  
+ Easy motion-based navigation via [hop.nvim](https://github.com/phaazon/hop.nvim).  
