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
This repo contains my Neovim configuration for Linux, MacOS, and Windows. It's designed to be fast, modular, and highly customizable. While it's built to work out of the box, it's also structured to encourage experimentation and personalization, so you can adapt it to your unique coding style.

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
git clone https://github.com/arslanarkananta/nvim-config.git $HOME/.config/nvim

# On Windows
git clone https://github.com/arslanarkananta/nvim-config.git $HOME\AppData\Local\nvim
```

## Features
+ Package management via [Lazy.nvim](https://github.com/folke/lazy.nvim).
+ Language server protocol (LSP) support via [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig).
+ Code, word, and snippet auto-completion via [nvim-cmp](https://github.com/hrsh7th/nvim-cmp).
+ Syntax highlighting and parsing via [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter).  
+ Command-line completion via [wilder.nvim](https://github.com/gelguy/wilder.nvim).  
+ File explorer and tree view via [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim).  
+ Fuzzy finding and file searching via [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim).
+ Git integration, commands, and signs via [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) and [vim-fugitive](https://github.com/tpope/vim-fugitive).
+ Markdown support and live preview via [vim-markdown](https://github.com/preservim/vim-markdown) and [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim).
+ Enhanced fold management and UI via [nvim-ufo](https://github.com/kevinhwang91/nvim-ufo) and [statuscol.nvim](https://github.com/luukvbaal/statuscol.nvim).
+ Startup screen and notification system via [alpha-nvim](https://github.com/goolord/alpha-nvim).
+ Notification system via [nvim-notify](https://github.com/rcarriga/nvim-notify).
+ Buffer tabline and statusline customization via [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) and [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim).
+ Tag viewer and automatic tag management via [vista.vim](https://github.com/liuchengxu/vista.vim) and [vim-gutentags](https://github.com/ludovicchabant/vim-gutentags).
+ Text manipulation and commenting via [vim-surround](https://github.com/tpope/vim-surround) and [Comment.nvim](https://github.com/numToStr/Comment.nvim).
+ Bullet point management for lists via [bullets.vim](https://github.com/dkarter/bullets.vim)
+ Faster navigation and key sequence escaping via [hop.nvim](https://github.com/phaazon/hop.nvim) and [better-escape.nvim](https://github.com/max397574/better-escape.nvim).
+ Code formatting via [neoformat](https://github.com/sbdchd/neoformat). 

#
<p style="text-align: center;">To see more demonstrations, check <a href="https://github.com/arslanarkananta/nvim-config/issues/7">here</a></p>

<table>
    <tr>
        <td align="center"><strong>Start screen with alpha-nvim</strong><br>
            <img src="https://github.com/user-attachments/assets/e3746f2e-66ea-47ed-88b9-f353bf6c75d8" width="400">
        </td>
        <td align="center"><strong>Autocompletion using nvim-cmp</strong><br>
            <img src="https://github.com/user-attachments/assets/692cafdd-9ed6-4950-bf2f-7f102f07896c" width="400">
        </td>
    </tr>
    <tr>
        <td align="center"><strong>Undotree, neo-tree.nvim, and vista.vim</strong><br>
            <img src="https://github.com/user-attachments/assets/59bf7d68-946a-462d-a90b-54efc9389f51" width="400">
        </td>
        <td align="center"><strong>Folding using nvim-ufo</strong><br>
            <img src="https://github.com/user-attachments/assets/8decbac4-3cfe-490f-bb75-82aea5028073" width="400">
        </td>
    </tr>
    <tr>
        <td align="center"><strong>GUI notification using nvim-notify</strong><br>
            <img src="https://github.com/user-attachments/assets/d1645fec-4e28-4cbd-ad77-8a4395d36d1c" width="400">
        </td>
        <td align="center"><strong>Wildmenu autocompletion using wilder.nvim</strong><br>
            <img src="https://github.com/user-attachments/assets/ecf8d254-89ed-4254-8d53-4e2a4caa48f4" width="400">
        </td>
    </tr>
</table>
