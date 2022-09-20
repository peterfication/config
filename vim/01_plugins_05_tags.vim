" # Tagbar
" nnoremap <Leader>zz :TagbarToggle<CR>

" # Gutentags
" Tips from
" https://www.reddit.com/r/vim/comments/d77t6j/guide_how_to_setup_ctags_with_gutentags_properly/
"
" Maybe have a look at:
" - https://github.com/romainl/ctags-patterns-for-javascript

"  Specifically configure what a "new project" is for Gutentags. I had to do this for Javascript projects where you also want Gutentags to re-index since it's also faster to do small projects. If you have a small javascript project inside another project, this will help tracing quickly within the javascript project, since the tag file is smaller to trace and thus it takes Gutentags less time to find your definition you're looking for. Make sure you define this properly.
let g:gutentags_add_default_project_roots = 0
let g:gutentags_project_root = ['package.json', '.git']

let g:gutentags_cache_dir = expand('~/.cache/vim/ctags/')
command! -nargs=0 GutentagsClearCache call system('rm ' . g:gutentags_cache_dir . '/*')

" Make Gutentags generate in most cases. let g:gutentags_generate_on_write = 1 is a must in my opinion. Gutentags should generate new tags if you just finished writing a new file which you're going to include and use in another file. When you write it, you can immediately jump to its definitions. This saves you time by manually calling Gutentags.
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 0

" Let Gutentags generate more info for the tags.
" Explaining --fields=+ailmnS (info gathered from: $ ctags --list-fields)
"     a: Access (or export) of class members
"     i: Inheritance information
"     l: Language of input file containing tag
"     m: Implementation information
"     n: Line number of tag definition
"     S: Signature of routine (e.g. prototype or parameter list)
let g:gutentags_ctags_extra_args = [
  \ '--tag-relative=yes',
  \ '--fields=+ailmnS',
  \ ]

let g:gutentags_ctags_exclude = [
  \ '*.git', '*.svg', '*.hg',
  \ '*/tests/*',
  \ 'build',
  \ 'dist',
  \ '*sites/*/files/*',
  \ 'bin',
  \ 'node_modules',
  \ 'bower_components',
  \ 'cache',
  \ 'compiled',
  \ 'docs',
  \ 'example',
  \ 'bundle',
  \ 'vendor',
  \ '*.md',
  \ '*-lock.json',
  \ '*.lock',
  \ '*bundle*.js',
  \ '*build*.js',
  \ '*/.next/*',
  \ '.*rc*',
  \ '*.json',
  \ '*.min.*',
  \ '*.map',
  \ '*.bak',
  \ '*.zip',
  \ '*.pyc',
  \ '*.class',
  \ '*.sln',
  \ '*.Master',
  \ '*.csproj',
  \ '*.tmp',
  \ '*.csproj.user',
  \ '*.cache',
  \ '*.pdb',
  \ 'tags*',
  \ 'cscope.*',
  \ '*.css',
  \ '*.less',
  \ '*.scss',
  \ '*.exe', '*.dll',
  \ '*.mp3', '*.ogg', '*.flac',
  \ '*.swp', '*.swo',
  \ '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png',
  \ '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
  \ '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx',
  \ ]
