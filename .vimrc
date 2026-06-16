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

" 把 hi Normal 的 ctermbg 改为 none 即可透明背景
colorscheme catppuccin

" 允许使用鼠标
set mouse=a
" 允许在行首/尾按 h,←,backspace / l,→,space 将光标移动至上/下一行
set whichwrap=h,l,<,>,[,],b,s

" 自动切换输入法，archwiki上给的似乎语法有问题所以改了一点
let fcitx5state = system("fcitx5-remote")
" 退出插入模式时禁用输入法，并保存状态
autocmd InsertLeave * silent let fcitx5state = system("fcitx5-remote")[0] | silent call system("fcitx5-remote -c")
" 2 表示之前状态打开了输入法，则进入插入模式时启动输入法
autocmd InsertEnter * silent if fcitx5state == '2' | call system("fcitx5-remote -o") | endif
