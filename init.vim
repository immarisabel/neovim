
"┌────────────────────────────────────────┐
"│===============   INTRO   ==============│
"└────────────────────────────────────────┘
" KISS
" Because I got tired of trying to make LSP and Lazy work on WIndows. Most guides and set ups are for Linux. So until I migrate, which I won't anytime soon, this will do.

" Marisabel Munoz
" https://marisabel.nl
" @imMarisabel

"┌────────────────────────────────────────┐
"│===============  SET UP   ==============│
"└────────────────────────────────────────┘
	set number
	let mapleader = ","
	"setlocal spell spelllang=en_us
	language en_US
	set termguicolors
	
	set tabstop=4
	set shiftwidth=4
	set expandtab
	set incsearch
	set showmatch
	set wrap
	set lines=40
	set foldcolumn=2	
	call plug#begin()
	
"┌────────────────────────────────────────┐
"│===============   PLUGS   ==============│
"└────────────────────────────────────────┘

" UTILS

    Plug 'toppair/peek.nvim', { 'do': 'deno task --quiet build:fast' }

	Plug 'thaerkh/vim-workspace'
	let g:workspace_autocreate = 0
	let g:workspace_autosave_always = 1
	
    Plug 'mechatroner/rainbow_csv'

    Plug 'sontungexpt/url-open', { 'on': 'VeryLazy', 'cmd': 'URLOpenUnderCursor' }
	if has('nvim')
		autocmd VimEnter * Plug 'sontungexpt/url-open', { 'on': 'VeryLazy', 'cmd': 'URLOpenUnderCursor' }
		autocmd VimEnter * lua require'url-open'.setup({})
	endif
    nnoremap <C-c> :URLOpenUnderCursor<CR>

"┌────────────────────────────────────────┐
"│    Snippets                            │
"└────────────────────────────────────────┘

	Plug 'dcampos/nvim-snippy'
	Plug 'honza/vim-snippets'
	
	imap <expr> <Tab> snippy#can_expand_or_advance() ? '<Plug>(snippy-expand-or-advance)' : '<Tab>'
	imap <expr> <S-Tab> snippy#can_jump(-1) ? '<Plug>(snippy-previous)' : '<S-Tab>'
	smap <expr> <Tab> snippy#can_jump(1) ? '<Plug>(snippy-next)' : '<Tab>'
	smap <expr> <S-Tab> snippy#can_jump(-1) ? '<Plug>(snippy-previous)' : '<S-Tab>'
	xmap <Tab> <Plug>(snippy-cut-text)

"┌────────────────────────────────────────┐
"│    NERDTree                            │
"└────────────────────────────────────────┘
	Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }

	nnoremap <leader>n :NERDTreeFocus<CR>
	nnoremap <C-n> :NERDTree<CR>
	nnoremap <C-t> :NERDTreeToggle<CR>
	nnoremap <C-f> :NERDTreeFind<CR>
	nnoremap <F9> :NERDTreeToggle C:\Users\Administrator\.android\Documents\Writing

"┌────────────────────────────────────────┐
"│    Zen Mode                            │
"└────────────────────────────────────────┘
	Plug 'folke/zen-mode.nvim'
	
	nnoremap <C-z> :ZenMode<CR>
"┌────────────────────────────────────────┐
"│    Telescope                           │
"└────────────────────────────────────────┘
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'nvim-telescope/telescope-symbols.nvim'
	
	nnoremap <leader>ff <cmd>Telescope find_files<cr>
	nnoremap <leader>fg <cmd>Telescope live_grep<cr>
	nnoremap <leader>fb <cmd>Telescope buffers<cr>
	nnoremap <leader>fh <cmd>Telescope help_tags<cr>
	nnoremap <leader>fz <cmd>Telescope current_buffer_fuzzy_find<cr> 
	nnoremap <leader>fe <cmd>Telescope symbols<cr> 
"┌────────────────────────────────────────┐
"│    Which Key                           │
"└────────────────────────────────────────┘	
	Plug 'folke/which-key.nvim'
	nnoremap <C-k> <cmd>WhichKey<cr>
	
"┌────────────────────────────────────────┐
"│    Telekasten                          │
"└────────────────────────────────────────┘		
	Plug 'renerocksai/telekasten.nvim'
	Plug 'renerocksai/calendar-vim'
	
	nnoremap <leader>kk <cmd>Telekasten panel<CR><cr>

	nnoremap <leader>kn <cmd>Telekasten new_note<CR><cr>
	nnoremap <leader>kt <cmd>Telekasten new_templated_note<CR><cr>
	nnoremap <leader>kr <cmd>Telekasten rename_note<CR><cr> "choco install sed
	nnoremap <leader>ks <cmd>Telekasten switch_vault<CR><cr>
	
	nnoremap <leader>ktt <cmd>Telekasten goto_today<CR><cr>
	nnoremap <leader>ktw <cmd>Telekasten goto_thisweek<CR><cr>
	nnoremap <leader>ktd <cmd>Telekasten toggle_todo<CR><cr>
	nnoremap <leader>ki <cmd>Telekasten paste_img_and_link<CR><cr>
	nnoremap <leader>kc <cmd>Telekasten show_calendar<CR><cr>
	
	nnoremap <leader>kfd <cmd>Telekasten find_daily_notes<CR><cr>
	nnoremap <leader>kfw <cmd>Telekasten find_weekly_notes<CR><cr>
	nnoremap <leader>ksb <cmd>Telekasten show_backlinks<CR><cr>
	nnoremap <leader>ksf <cmd>Telekasten find_friends<CR><cr>
	nnoremap <leader>kst <cmd>Telekasten show_tags<CR><cr>
"┌────────────────────────────────────────┐
"│    Bujo                                │
"└────────────────────────────────────────┘	
	Plug 'vuciv/vim-bujo'
	
	nnoremap <leader>td <cmd>Todo<CR><cr>
	nmap <C-a> <Plug>BujoAddnormal
	imap <C-a> <Plug>BujoAddinsert
	nmap <C-q> <Plug>BujoChecknormal
	imap <C-q> <Plug>BujoCheckinsert

"┌────────────────────────────────────────┐
"│    Look & Feel                         │
"└────────────────────────────────────────┘	

	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'nvim-tree/nvim-web-devicons'

	" THEMES
	
	Plug 'navarasu/onedark.nvim'
	Plug 'catppuccin/nvim'
	Plug 'Allianaab2m/penumbra.nvim'

	Plug 'immarisabel/nvim-startpage'
"┌────────────────────────────────────────┐
"│===============   START   ==============│
"└────────────────────────────────────────┘

	call plug#end()

	syntax enable
	
	let g:airline_theme='violet'
	
" set up which theme to use
lua << EOF
	require('penumbra').load()

	require('telekasten').setup({
	  home = vim.fn.expand("~/.android/Documents/Writing/Notes"),
	})
EOF

"┌────────────────────────────────────────┐
"│===============   KEYS    ==============│
"└────────────────────────────────────────┘
	
	nnoremap <leader>q <cmd>:q!<CR><cr>
	nnoremap <leader>t <cmd>:terminal<CR><cr>
	nnoremap <leader>w <cmd>:w!<CR><cr>
	
	nnoremap <A-p> <cmd>PlugInstall<CR><cr>
	nnoremap <A-o> <cmd>PlugClean<CR><cr>

	nnoremap <F8> :e ~/AppData/Local/nvim/Dashboard.txt <Enter>
	nnoremap <F7> :e ~/AppData/Local/nvim/init.vim <Enter>
	nnoremap <leader>s :ToggleWorkspace<CR>

"	BUFFERS
	nnoremap <leader>znb :new<CR>
	nnoremap <leader>zbn :bn<CR> " next buffer
	nnoremap <leader>zbp :bp<CR> " prev buffer
	nnoremap <leader>zbc :bd<CR> " close file

	

	