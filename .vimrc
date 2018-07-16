"显示行号 高亮行
set nu
set cursorline


set tabstop=4                       " tab缩进
set shiftwidth=4                    " 默认缩进4个空格大小 
set expandtab                       " 用空格键替换制表符 
set autoindent                      " 自动缩进
set smartindent                     " 智能缩进
"set cindent                        " c文件自动缩进
set autoindent                      " 自动对齐


set encoding=utf-8                  " 文件编码
set fileencoding=utf-8

set autoread                        " 文件自动检测外部更改
set confirm                         " 没有保存或文件只读时弹出确认



set whichwrap=b,s,<,>,[,] "         " 设置单词的间隙字符

set hlsearch  "高亮查找匹配


set ruler     "显示标尺，就是在右下角显示光标位置

"语法高亮
syntax on
syntax enable
colorscheme monokai

set clipboard+=unnamed  " 同步系统剪切板

"set mouse=a        " 鼠标支持 



" 括号补全
inoremap ( <c-r>=SeqMatch('(', ')')<CR>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap { <c-r>=SeqMatch('{', '}')<CR>
inoremap } <c-r>=ClosePair('}')<CR>
inoremap [ <c-r>=SeqMatch('[', ']')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap " <c-r>=SeqMatch('"', '"')<CR>
inoremap ' <c-r>=SeqMatch("'", "'")<CR>
inoremap <CR> <c-r>=CROption()<CR>
func! SeqMatch(u, v)
    if g:paste_status == 1
        return a:u
    else
        return printf("%s%s\<Left>", a:u, a:v)
    endif
endfunc
func! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunc

func CROption()
    if g:paste_status == 1
        return "\<CR>"
    elseif &filetype != 'c'&& &filetype != 'cpp' && &filetype != 'h' && &filetype != 'cc'
        return "\<CR>"
    endif

    let line = getline('.')
    let len = strlen(line)
    let pos = col('.')
    if pos - 2 < 0 || pos - 1 >= len
        return "\<CR>"
    elseif line[pos - 2] == '{' && line[pos - 1] == '}'
        return "\<CR>\<CR>\<BS>\<UP>\<ESC>A"
    else
        return "\<CR>"
    endif
return "\<CR>"
endfunc




" Vundle Section Start
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'                  " let Vundle manage Vundle, required
Plugin 'airblade/vim-gitgutter'                " 实时显示git更改
Plugin 'altercation/vim-colors-solarized'      " 颜色主题
Plugin 'flazz/vim-colorschemes'
"Plugin 'brookhong/cscope.vim'                  " 创建/更新cscope数据库并自动连接到现有的正确数据库。
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'majutsushi/tagbar'                     " displays tags in a window, ordered by scope
Plugin 'rdnetto/YCM-Generator'                 " config_gen.py用于生成.ycmextra_conf.py文件
Plugin 'rhysd/vim-clang-format'                " formatter for C, C++, Obj-C, Java, JavaScript...
Plugin 'scrooloose/nerdcommenter'              " leader+cc注释,leader+cu解除
Plugin 'scrooloose/nerdtree'                   " 增强侧栏
"Plugin 'SirVer/ultisnips'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/a.vim'                     " 可以快速切换源文件和头文件
Plugin 'vim-scripts/indentpython.vim'          " 用于python代码的自动缩进

call vundle#end()
filetype plugin indent on
" Vundle Section End




" plugin config

" airblade/vim-gitgutter
set updatetime=500

" majutsushi/tagbar
nmap <F8> :TagbarToggle<CR>



let g:gitgutter_terminal_reports_focus=0
let mapleader=";" "自定义前缀键


" 设置nerdTree快捷键
map <C-e> :NERDTreeToggle<CR>


set completeopt=longest,menu    "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"    "回车即选中当前项
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

"youcompleteme  默认tab  s-tab 和自动补全冲突
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示

let g:ycm_collect_identifiers_from_tags_files=1 " 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2 " 从第2个键入字符就开始罗列匹配项
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
let g:ycm_semantic_triggers = { 
        \     'c' : ['->', '  ', '.', ' ', '(', '[', '&'],
        \     'cpp,objcpp' : ['->', '.', ' ', '(', '[', '&', '::'],
        \     'perl' : ['->', '::', ' '],
        \     'php' : ['->', '::', '.'],
        \     'cs,java,javascript,d,vim,python,perl6,scala,vb,elixir,go' : ['.'],
        \     'ruby' : ['.', '::'],
        \     'lua' : ['.', ':']
        \ }
let g:ycm_auto_trigger = 1
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
let g:ycm_autoclose_preview_window_after_completion = 1 
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_enable_diagnostic_signs = 0
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <F4> :YcmDiags<CR>

" vim里,窗口之间的移动
map <C-j> <C-w>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map <leader>" :sp<CR>
map <leader>% :vsp<CR>
map <leader>s :w<CR>
map <leader>q :q!<CR>
map <leader>e :e<CR>
map <leader>w :wq!<CR>

" 按leader+Q 调用astyle格式化代码
map <leader>format :call FormatCode()<CR>
func FormatCode()
    exec "w"
    if &filetype == 'c' || &filetype == 'h' || &filetype == 'cpp' || &filetype == 'cc'
        exec "%! astyle -A2 -p -N -Y -o -N -k3 -s4"
    endif
endfunc

let g:hlsearch_status = 1
map <leader>hl :call FuncHlsearchToggle()<CR>
func FuncHlsearchToggle()
    if g:hlsearch_status == 1
        :set nohlsearch
        let g:hlsearch_status = 0
    else
        :set hlsearch
        let g:hlsearch_status = 1
    endif
endfunc

let g:number_status = 1
map <leader>n :call NumberToggle()<CR>
func NumberToggle()
    if g:number_status == 1
        :set nonu
        :GitGutterDisable
        let g:number_status = 0
    else
        :set nu
        :GitGutterEnable
        let g:number_status = 1
    endif
endfunc

" 设置paste的快捷键
let g:paste_status = 0
map <leader>p :call PasteToggle()<CR>
func PasteToggle()
    if g:paste_status == 1
        :set nopaste
        let g:paste_status = 0
    else
        :set paste
        let g:paste_status = 1
    endif
endfunc


"这个是安装字体后 必须设置此项"
let g:airline_powerline_fonts = 1

 "打开tabline功能,方便查看Buffer和切换，这个功能比较不错"
 "我还省去了minibufexpl插件，因为我习惯在1个Tab下用多个buffer"
 let g:airline#extensions#tabline#enabled = 1
 let g:airline#extensions#tabline#buffer_nr_show = 1

 "设置切换Buffer快捷键"
 nnoremap <C-N> :bn<CR>
 nnoremap <C-P> :bp<CR>

 " 关闭状态显示空白符号计数,这个对我用处不大"
 let g:airline#extensions#whitespace#enabled = 0
 let g:airline#extensions#whitespace#symbol = '!'
