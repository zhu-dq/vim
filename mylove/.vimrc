"---------------------------------------- 
let mapleader=";" 		" 定义快捷键的前缀，即 <Leader> 
set backspace=2 		"退格键可用 
set number 			" 开启行号显示 
"set mouse=a 			"鼠标可用
syntax on			"语法高亮
set nowrap			" 禁止折行
"中文乱码 
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936 
set termencoding=utf-8 
set encoding=utf-8 
"解决consle输出乱码 
language messages zh_CN.utf-8 
"行 列
set cursorline 
"set cursorcolumn 
" 配色方案
syntax enable
"最爱
colorscheme monokai
"下面两个结合也很好看
"set background=dark
"colorscheme solarized
"colorscheme molokai
" colorscheme phd
"----------------------------------------- 
" 插件管理  pathogen+vundle
"pathogen是为了解决每一个插件安装后文件分散到多个目录不好管理而存在的。
runtime bundle/vim-pathogen/autoload/pathogen.vim 	" 将 pathogen 自身也置于独立目录中，需指定其路径 
" 运行 pathogen 
execute pathogen#infect() 			

"vundle是为了解决自动搜索及下载插件而存在的。
set nocompatible
filetype off                              " 先关闭文件类型
set rtp+=~/.vim/bundle/vundle             " 将vundle路径添加到插件vim路径
call vundle#rc()                          " 执行Vundle初始化
 " 将Vundle加入到bundle  vundle是为了解决自动搜索及下载插件
Bundle 'gmarik/vundle'                   
 "  YCM
Bundle 'Valloric/YouCompleteMe'		     
 "  插件管理  
Bundle 'tpope/vim-pathogen'		         
  "  目录树
Bundle 'scrooloose/nerdtree'		    
Bundle 'scrooloose/syntastic'
 " markdown预览 识别 .markdown
Bundle 'suan/vim-instant-markdown'	    
"  识别 .md 
Bundle 'tpope/vim-markdown'
filetype indent plugin on                 " 安装完后打开文件类型
"----------------------------------------------------------------
" 目录树 
 
nmap <Leader>fl :NERDTreeToggle<CR> 		" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
let NERDTreeWinSize=22 				" 设置 NERDTree 子窗口宽度 
let NERDTreeWinPos="left" 			" 设置 NERDTree 子窗口位置 
"let NERDChristmasTree=1 			"让树更好看,我是没看出来 
"let NERDTreeCaseSensitiveSort=1 		" 让文件排列更有序 
"let NERDTreeChDirMode=1 			" 改变tree目录的同时改变工程的目录 
"let NERDTreeShowBookmarks=1 
autocmd vimenter * NERDTree 
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif 
"光标初始在右 
wincmd w 
autocmd VimEnter * wincmd w 
"let NERDTreeShowHidden=1 			" 显示隐藏文件 
"let NERDTreeMinimalUI=1 			" NERDTree 子窗口中不显示冗余帮助信息  
let NERDTreeAutoDeleteBuffer=1 			" 删除文件时自动删除文件对应 buffer
"---------------------------------------------------------------------- 
let g:ycm_complete_in_comments=1 		" 补全功能在注释中同样有效  
let g:ycm_confirm_extra_conf=0 			" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_collect_identifiers_from_tags_files=1 " 开启 YCM 标签补全引擎 
" 引入 C++ 标准库tags 
"set tags+=/data/misc/software/misc./vim/stdcpp.tags 
set tags+=/usr/include/c++/tags 
set tags+=/home/zhudanqi/download/stltags/tags  "stl 
set tags+=../tags				"F2  生成的tags
set tags+=~/download/llvm/tags			"llvm tags
inoremap <leader>; <C-x><C-o> 			" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键 
set completeopt-=preview 			" 补全内容不以分割子窗口形式出现，只显示补全列表 
let g:ycm_min_num_of_chars_for_completion=1 	" 从第一个键入字符就开始罗列匹配项 
let g:ycm_cache_omnifunc=0 			" 禁止缓存匹配项，每次都重新生成匹配项       
let g:ycm_seed_identifiers_with_syntax=1 	" 语法关键字补全    
"------------------------------------------------------------------ 
" 缩进
filetype indent on				" 自适应不同语言的智能缩进
set expandtab					" 将制表符扩展为空格
set tabstop=4					" 设置编辑时制表符占用空格数
set shiftwidth=4				" 设置格式化时制表符占用空格数
set softtabstop=4				" 让 vim 把连续数量的空格视为一个制表符
"----------------------------------------------------------------------
" 接口与实现快速切换
nmap <Leader>ch :A<CR>				" *.cpp 和 *.h 间切换
nmap <Leader>hh :AV<CR>				" 子窗口中显示 *.cpp 或 *.h
"----------------------------------------------------------
" 模板补全
" UltiSnips 的 tab 键与 YCM 冲突，重新设定
let g:UltiSnipsSnippetDirectories=["mysnippets"]
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"
"------------------------------------------------------------
" 设置快捷键实现一键编译及运行
noremap <F2> :cd ..<CR>:!ctags -R<CR> 
nmap <F5> :wa<CR>:cd ../build/<CR>:!rm -rf main<CR>:!cmake ..<CR>:make<CR>:cw<CR>:!clear;./main<CR>
"-----------------------------------------------------------------------------------
" markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
"let g:instant_markdown_slow = 1
"let g:instant_markdown_autostart = 0
"-----------------------------------------------------------
" 静态分析器 syntastic 错误标识
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
"-------------------------------------------------------------
