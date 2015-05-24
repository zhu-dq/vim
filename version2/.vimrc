"---------------------------------------- 
" 定义快捷键的前缀，即 <Leader> 
let mapleader=";" 
 "退格键可用 
 set backspace=2 
" 开启行号显示 
set number 
"鼠标可用
"set mouse=a 
"中文乱码 
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936 
set termencoding=utf-8 
set encoding=utf-8 

"解决consle输出乱码 
language messages zh_CN.utf-8 
"行 列
set cursorline 
"set cursorcolumn 
"----------------------------------------- 
" 插件管理 
" 将 pathogen 自身也置于独立目录中，需指定其路径 
runtime bundle/pathogen/autoload/pathogen.vim 
" 运行 pathogen 
execute pathogen#infect() 
"---------------------------------------- 
syntax on 
set clipboard=unnamed 
set number 
set tabstop=4 shiftwidth=4 expandtab 

set nocompatible 
filetype off 

set rtp+=~/.vim/bundle/vundle/ 
call vundle#rc() 

Bundle 'gmarik/vundle' 
Bundle 'Valloric/YouCompleteMe' 

filetype plugin indent on 
"------------------------------------------------------------------- 
" 工程文件浏览 

" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list 
nmap <Leader>fl :NERDTreeToggle<CR> 
" 设置 NERDTree 子窗口宽度 
let NERDTreeWinSize=22 

" 设置 NERDTree 子窗口位置 
let NERDTreeWinPos="left" 
"let NERDChristmasTree=1 "让树更好看,我是没看出来 
"let NERDTreeCaseSensitiveSort=1 " 让文件排列更有序 
"let NERDTreeChDirMode=1 " 改变tree目录的同时改变工程的目录 
"let NERDTreeShowBookmarks=1 
autocmd vimenter * NERDTree 
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif 
"光标初始在右 
wincmd w 
autocmd VimEnter * wincmd w 
" 显示隐藏文件 
"let NERDTreeShowHidden=1 
" NERDTree 子窗口中不显示冗余帮助信息 
"let NERDTreeMinimalUI=1 
" 删除文件时自动删除文件对应 buffer 
let NERDTreeAutoDeleteBuffer=1 
"---------------------------------------------------------------------- 
" 补全功能在注释中同样有效 
let g:ycm_complete_in_comments=1 
" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示 
let g:ycm_confirm_extra_conf=0 
" 开启 YCM 标签补全引擎 
let g:ycm_collect_identifiers_from_tags_files=1 
" 引入 C++ 标准库tags 
set tags+=/data/misc/software/misc./vim/stdcpp.tags 
"set tags+=/usr/include/c++/tags 
" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键 
inoremap <leader>; <C-x><C-o> 
" 补全内容不以分割子窗口形式出现，只显示补全列表 
set completeopt-=preview 
" 从第一个键入字符就开始罗列匹配项 
let g:ycm_min_num_of_chars_for_completion=1 
" 禁止缓存匹配项，每次都重新生成匹配项 
let g:ycm_cache_omnifunc=0 
" 语法关键字补全          
let g:ycm_seed_identifiers_with_syntax=1 
"------------------------------------------------------------------ 
" 配色方案
"set background=dark
"let g:solarized_contrast="normal"
"let g:solarized_visibility="normal"
 "color solarized
"colorscheme solarized
syntax enable
colorscheme monokai
"colorscheme molokai
 "colorscheme phd
" 设置 gvim 显示字体
set guifont=YaHei\ Consolas\ Hybrid\ 11.5

" 禁止折行
set nowrap

" 设置状态栏主题风格
let g:Powerline_colorscheme='solarized256'

" 缩进

" 自适应不同语言的智能缩进
filetype indent on

" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4
"----------------------------------------------------------------------
" 接口与实现快速切换

" *.cpp 和 *.h 间切换
nmap <Leader>ch :A<CR>
" 子窗口中显示 *.cpp 或 *.h
nmap <Leader>hh :AV<CR>
"----------------------------------------------------------
" 模板补全
" UltiSnips 的 tab 键与 YCM 冲突，重新设定
let g:UltiSnipsSnippetDirectories=["mysnippets"]
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"
"------------------------------------------------------------
" 设置快捷键实现一键编译及运行
 "noremap <F2> :cd ..<CR>:!ctags -R<CR> 
"nmap <F5> :wa<CR>:cd ../build/<CR>:!rm -rf main<CR>:!cmake ..<CR>:make<CR>:cw<CR>:!clear;./main<CR>
" markdown
"let g:instant_markdown_slow = 1
"let g:instant_markdown_autostart = 0

"set tags+=../tags
"set tags+=~/download/llvm/tags
"-----------------------------------------------------------
