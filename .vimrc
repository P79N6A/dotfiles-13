"显示行号
set nu

"tab缩进
set tabstop=4
"默认缩进4个空格大小 
set shiftwidth=4 
"用空格键替换制表符 
set expandtab 
set smarttab
"智能缩进
set smartindent
"c文件自动缩进
set cindent
"自动对齐
set autoindent

"文件编码
set encoding=utf-8
set fileencoding=utf-8
"文件自动检测外部更改
set autoread
"没有保存或文件只读时弹出确认
set confirm


"高亮查找匹配
set hlsearch

"显示标尺，就是在右下角显示光标位置
set ruler

"语法高亮
syntax on
syntax enable
colorscheme monokai

" 插入匹配括号
inoremap ( ()<LEFT>
inoremap [ []<LEFT>
inoremap { {}<LEFT>
inoremap ' ''<LEFT>
inoremap " ""<LEFT>


