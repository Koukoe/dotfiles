" 自动安装 vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'junegunn/vim-plug'
Plug 'vim-airline/vim-airline'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'mbbill/undotree'

call plug#end()

" set timeoutlen=500
set ttimeoutlen=10

" 显示行号
set number
" 高亮当前行
set cursorline
" 更智能的换行显示
set linebreak
" Alt + j/k 移动行
nnoremap <A-j> :m .+1<CR>==
vnoremap <A-j> :m '>+1<CR>gv=gv
inoremap <A-j> <C-O>:m .+1<CR><C-O>==
nnoremap <A-Down> :m .+1<CR>==
vnoremap <A-Down> :m '>+1<CR>gv=gv
inoremap <A-Down> <C-O>:m .+1<CR><C-O>==
nnoremap <A-k> :m .-2<CR>==
vnoremap <A-k> :m '<-2<CR>gv=gv
inoremap <A-k> <C-O>:m .-2<CR><C-O>==
nnoremap <A-Up> :m .-2<CR>==
vnoremap <A-Up> :m '<-2<CR>gv=gv
inoremap <A-Up> <C-O>:m .-2<CR><C-O>==

" 显示标题
set title

" 语法高亮
filetype plugin on
syntax on
filetype indent on

" 自动缩进
set autoindent

" 高亮显示所有搜索结果
set hlsearch
" 增量搜索，输入搜索内容时实时显示匹配内容
set incsearch
" 大小写不敏感搜索
set ignorecase
" 搜索内容中包含大写字母时切换为大小写敏感搜索
set smartcase
" 按 Ctrl + L 清除搜索
nnoremap <silent> <C-l> :let @/=''<CR>

" https://sw.kovidgoyal.net/kitty/faq/#using-a-color-theme-with-a-background-color-does-not-work-well-in-vim
" Mouse support
set mouse=a
set ttymouse=sgr
set balloonevalterm
" Styled and colored underline support
let &t_AU = "\e[58:5:%dm"
let &t_8u = "\e[58:2:%lu:%lu:%lum"
let &t_Us = "\e[4:2m"
let &t_Cs = "\e[4:3m"
let &t_ds = "\e[4:4m"
let &t_Ds = "\e[4:5m"
let &t_Ce = "\e[4:0m"
" Strikethrough
let &t_Ts = "\e[9m"
let &t_Te = "\e[29m"
" Truecolor support
let &t_8f = "\e[38:2:%lu:%lu:%lum"
let &t_8b = "\e[48:2:%lu:%lu:%lum"
let &t_RF = "\e]10;?\e\\"
let &t_RB = "\e]11;?\e\\"
" Bracketed paste
let &t_BE = "\e[?2004h"
let &t_BD = "\e[?2004l"
let &t_PS = "\e[200~"
let &t_PE = "\e[201~"
" Cursor control
let &t_RC = "\e[?12$p"
let &t_SH = "\e[%d q"
let &t_RS = "\eP$q q\e\\"
let &t_SI = "\e[5 q"
let &t_SR = "\e[3 q"
let &t_EI = "\e[1 q"
let &t_VS = "\e[?12l"
" Focus tracking
let &t_fe = "\e[?1004h"
let &t_fd = "\e[?1004l"
execute "set <FocusGained>=\<Esc>[I"
execute "set <FocusLost>=\<Esc>[O"
" Window title
let &t_ST = "\e[22;2t"
let &t_RT = "\e[23;2t"
" vim hardcodes background color erase even if the terminfo file does
" not contain bce. This causes incorrect background rendering when
" using a color theme with a background color in terminals such as
" kitty that do not support background color erase.
let &t_ut=''
" end of configs from kitty
let &t_ti = &t_ti . "\e[1 q"	" 进入 vim 变块状
" 进出命令行切换光标
autocmd CmdlineEnter * silent !echo -ne "\e[5 q"
autocmd CmdlineLeave * silent !echo -ne "\e[1 q"

set termguicolors
colorscheme catppuccin_mocha
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#show_buffers = 0
" 斜体注释
highlight Comment cterm=italic gui=italic
" Tab 缩进线
set list lcs=tab:\│\ " 这里要有一个空格
highlight SpecialKey guifg=#6c7086

" Ctrl + / 切换注释
nmap <silent> <C-/> <leader>c<Space>
vmap <silent> <C-/> <leader>c<Space>gv
imap <silent> <C-/> <C-O><leader>c<Space>
" Create default mappings
let g:NERDCreateDefaultMappings = 1
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

" 和 vim 的快捷键会冲突所以还是习惯一下 vim-surround 吧
" vnoremap ' <Esc>`>a'<Esc>`<i'<Esc>gvll
" vnoremap " <Esc>`>a"<Esc>`<i"<Esc>gvll
" vnoremap ` <Esc>`>a`<Esc>`<i`<Esc>gvll
" vnoremap ( <Esc>`>a)<Esc>`<i(<Esc>gvll
" vnoremap ) <Esc>`>a)<Esc>`<i(<Esc>gvll
" vnoremap [ <Esc>`>a]<Esc>`<i[<Esc>gvll
" vnoremap ] <Esc>`>a]<Esc>`<i[<Esc>gvll
" vnoremap { <Esc>`>a}<Esc>`<i{<Esc>gvll
" vnoremap } <Esc>`>a}<Esc>`<i{<Esc>gvll
" vnoremap < <Esc>`>a><Esc>`<i<<Esc>gvll

" 持久化撤销
set undofile
silent !mkdir -p ~/.cache/vim/undo
set undodir=~/.cache/vim/undo
" F5 切换 Undotree
nnoremap <F5> :UndotreeToggle<CR>

" 记录上次光标位置
augroup resCur
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END
" 允许在行首/尾按 h,←,backspace / l,→,space 将光标移动至上/下一行
set whichwrap=h,l,<,>,[,],b,s
" 光标和窗口距离
set scrolloff=4
set sidescrolloff=8

" 剪贴板, 需使用 gvim 包以获取带有 +clipboard 特性的 vim
" 使用 "+ 寄存器, 文本进入 CLIPBOARD 缓冲区(ctrl + c/v 的那个)
" yank 操作的文本还会使用 "* 寄存器
set clipboard=unnamedplus,unnamed
" 可视模式下使用 ctrl + c/x/v 进行复制剪粘贴
vnoremap <C-c> "+y
vnoremap <C-x> "+x
vnoremap <C-v> "+P
" 插入模式下使用 ctrl + v 进行粘贴
inoremap <C-v> <C-r><C-o>+
" d,D 使用 "* 寄存器, 文本进入 PRIMARY 缓冲区(选中复制, 中键粘贴的那个)
nnoremap d "*d
nnoremap D "*D
vnoremap d "*d
vnoremap D "*D

" 非图形界面进入 vim 时禁用终端的 ctrl + s/z
if !has('gui_running')
  autocmd VimEnter * call system("stty -ixon susp undef")
  autocmd VimLeave * call system("stty ixon susp ^Z")
endif
" ctrl + s 保存
nnoremap <C-s> :update<CR>
vnoremap <C-s> <Esc>:update<CR>gv
inoremap <C-s> <Esc>:update<CR>gi
" ctrl + z/y 撤销/重做
nnoremap <C-z> u
vnoremap <C-z> <Esc>u
inoremap <C-z> <C-o>u
nnoremap <C-y> <C-r>
vnoremap <C-y> <Esc><C-r>
inoremap <C-y> <C-o><C-r>

" 自动切换输入法，archwiki上给的似乎语法有问题所以改了一点
let fcitx5state = system("fcitx5-remote")
" 退出插入模式时禁用输入法，并保存状态
autocmd InsertLeave * silent let fcitx5state = system("fcitx5-remote")[0] | silent call system("fcitx5-remote -c")
" 2 表示之前状态打开了输入法，则进入插入模式时启动输入法
autocmd InsertEnter * silent if fcitx5state == '2' | call system("fcitx5-remote -o") | endif
autocmd VimEnter * call job_start("fcitx5-remote -c")
