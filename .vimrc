" 显示行号
set number

" 语法高亮
syntax on

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

" 把 hi Normal 的 ctermbg 改为 NONE 即可透明背景
colorscheme catppuccin

" 允许使用鼠标
set mouse=a

" 允许在行首/尾按 h,←,backspace / l,→,space 将光标移动至上/下一行
set whichwrap=h,l,<,>,[,],b,s
" 根据模式切换光标样式
autocmd VimEnter * silent !echo -ne "\e[2 q"
let &t_SI = "\e[6 q"  " 进入插入模式变竖线
let &t_SR = "\e[4 q"  " 进入替换模式变下划线
let &t_EI = "\e[2 q"  " 退出插入模式变块状
" 进出命令行切换光标
autocmd CmdlineEnter * silent !echo -ne "\e[6 q"
autocmd CmdlineLeave * silent !echo -ne "\e[2 q"

" 使用系统剪贴板, 使用 gvim 包以获取带有 +clipboard 特性的 vim
set clipboard=unnamedplus
" 可视模式下使用 ctrl + c/x/v 进行复制剪粘贴
vnoremap <C-c> "+y
vnoremap <C-x> "+c
vnoremap <C-v> "+P
" 插入模式下使用 ctrl + v 进行粘贴
inoremap <C-v> <C-r><C-o>+

" 非图形界面进入 vim 时禁用终端的 ctrl + s/z
if !has('gui_running')
  autocmd VimEnter * silent !stty -ixon susp undef
  autocmd VimLeave * silent !stty ixon susp ^Z
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

" 持久化撤销
set undofile
silent !mkdir -p ~/.cache/vim/undo
set undodir=~/.cache/vim/undo

" 记录上次光标位置
augroup resCur
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

" 自动切换输入法，archwiki上给的似乎语法有问题所以改了一点
let fcitx5state = system("fcitx5-remote")
" 退出插入模式时禁用输入法，并保存状态
autocmd InsertLeave * silent let fcitx5state = system("fcitx5-remote")[0] | silent call system("fcitx5-remote -c")
" 2 表示之前状态打开了输入法，则进入插入模式时启动输入法
autocmd InsertEnter * silent if fcitx5state == '2' | call system("fcitx5-remote -o") | endif
