""""""""""""" vim setting
" change directory to project root
exec 'cd' fnameescape(fnamemodify(finddir('.git', escape(expand('%:p:h'), ' ') . ';'), ':h'))

" display line numbers on the left
set nu

" display the cursor position on the last line of the screen or in the status line of a window
set ruler

" display cursor crosshair
set cursorline
set cursorcolumn

" display line length marker
set cc=80

" display the status line, which includes file path and name
set laststatus=2

" show partial commands at the bottom of the screen
set showcmd

" show editing mode at the bottom of the screen
set showmode

" show all possible commands or parameters with the wildchar key
set wildmenu

" enable use of the mouse for normal mode
set mouse=n

" use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" do smart autoindenting when starting a new line
set si

" change tab size to 4 and expand tabs to spaces
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4

" keep the last 100 commands
set history=100

" highlight all search results
set hlsearch

" hide unsaved buffers and keep their undo histories
set hidden

" customize colors
let colortheme="light"
let autocolorswitch="true"
function SetColor(colortheme)
	let g:colortheme=a:colortheme
	if a:colortheme == "light"
		color PaperColor
		set t_Co=256
		set bg=light
		hi Search cterm=bold ctermfg=Black ctermbg=227
		hi CursorLine cterm=bold ctermfg=NONE ctermbg=159
		hi CursorColumn cterm=bold ctermfg=DarkGray ctermbg=NONE
		hi ColorColumn cterm=NONE ctermfg=NONE ctermbg=NONE
		hi LineNr cterm=bold ctermfg=DarkGray ctermbg=NONE
		hi CursorLineNr cterm=bold ctermfg=DarkGreen ctermbg=NONE
	elseif a:colortheme == "dark"
		color PaperColor
		set t_Co=256
		set bg=dark
		hi Search cterm=bold ctermfg=White ctermbg=161
		hi CursorLine cterm=bold,underline ctermfg=NONE ctermbg=239
		hi CursorColumn cterm=bold ctermfg=Gray ctermbg=NONE
		hi ColorColumn cterm=NONE ctermfg=NONE ctermbg=NONE
		hi LineNr cterm=bold ctermfg=Gray ctermbg=NONE
		hi CursorLineNr cterm=bold ctermfg=Green ctermbg=NONE
	else
	endif
	if exists('*SetAirColor')
		call SetAirColor(a:colortheme)
	endif
	return
endfunction
call SetColor(colortheme)
function SetAutoColor(autocolorswitch)
	let g:autocolorswitch=a:autocolorswitch
	if a:autocolorswitch == "true"
		let hour=strftime("%H")
		if 9 <= hour && hour < 17
			call SetColor("light")
		else
			call SetColor("dark")
		endif
	endif
	return
endfunction
call SetAutoColor(autocolorswitch)

" jump to prev/next quickfix list item
nmap <C-Left> :cp<CR>
nmap <C-Right> :cn<CR>

" open/close quickfix list window
nmap <C-Up> :copen<CR>
"nmap <C-Down> :cclose<CR>

" recall prev/next quickfix list
nmap <A-Up> :colder<CR>:cc<CR>
nmap <A-Down> :cnewer<CR>:cc<CR>

" show trailing white spaces
hi RedundantSpaces ctermbg=Red guibg=Red
match RedundantSpaces /\s\+$/

" delete all trailing white spaces
nmap <Leader>1 :%s/\s\+$//<CR>

" toggle paste mode
set pastetoggle=<Leader>2

" toggle line numbers
nmap <Leader>3 :set invnumber<CR>
imap <Leader>3 <C-O>:set invnumber<CR>


""""""""""""" ctag setting
if exists('&tags')
	set tags=./tags,tags,./TAGS,TAGS;~,~,~,~
endif
nmap <C-LeftMouse> g]
nmap z<LeftMouse> <C-t>


""""""""""""" taglist setting
"nmap <F8> :TlistToggle<CR>
let g:Tlist_Show_One_File=1
let g:Tlist_Exit_OnlyWindow=1
set ut=100


""""""""""""" nerdtree setting
"nmap <F9> :NERDTreeToggle<CR>
let g:NERDTreeChDirMode=2
let NERDTreeIgnore=['\.o$', '\~$']
let g:NERDTreeWinPos=1
nmap <Leader>4 :NERDTreeFind<CR>


""""""""""""" srcexpl setting
"nmap <F10> :SrcExplToggle<CR>
let g:SrcExpl_pluginList=["__Tag_List__", "_NERD_tree_", "Source_Explorer"]


""""""""""""" trinity setting
nmap <F7> :TrinityToggleAll<CR>
nmap <F8> :TrinityToggleTagList<CR>
nmap <F9> :TrinityToggleNERDTree<CR>
nmap <F10> :TrinityToggleSourceExplorer<CR>
nmap <C-Down> :cclose<CR>:TrinityUpdateWindow<CR>


""""""""""""" airline setting
function SetAirColor(colortheme)
	if a:colortheme == "light"
		let g:airline_theme="papercolor"
	elseif a:colortheme == "dark"
		let g:airline_theme="wombat"
	else
	endif
	if exists(':AirlineRefresh')
		AirlineRefresh
	endif
	return
endfunction
call SetAirColor(colortheme)
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.colnr = ' ℅:'
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' :'
let g:airline_symbols.maxlinenr = '☰ '
let g:airline_symbols.dirty=' '
let g:airline_section_b='%-0.22{getcwd()}'														"display environment status in section B
let g:airline_section_c='%-0.44F'																"display current file path in section C
let g:airline#extensions#tabline#enabled=1														"enable enhanced tabline
let g:airline#extensions#tabline#show_tab_count=1												"enable displaying number of tabs in the right side
let g:airline#extensions#tabline#tab_nr_type=1													"configure how numbers are displayed in tab mode
let g:airline#extensions#tabline#show_tab_nr=0													"enable displaying tab number in tabs mode
let g:airline#extensions#tabline#excludes=['branches', 'index']									"configure filename match rules to exclude from the tabline
let g:airline#extensions#tabline#buffer_idx_mode=3												"allow 3 different modes to access buffers from the tabline
nmap <TAB>01 <Plug>AirlineSelectTab01
nmap <TAB>02 <Plug>AirlineSelectTab02
nmap <TAB>03 <Plug>AirlineSelectTab03
nmap <TAB>04 <Plug>AirlineSelectTab04
nmap <TAB>05 <Plug>AirlineSelectTab05
nmap <TAB>06 <Plug>AirlineSelectTab06
nmap <TAB>07 <Plug>AirlineSelectTab07
nmap <TAB>08 <Plug>AirlineSelectTab08
nmap <TAB>09 <Plug>AirlineSelectTab09
nmap <TAB>10 <Plug>AirlineSelectTab10
nmap <TAB>11 <Plug>AirlineSelectTab11
nmap <TAB>12 <Plug>AirlineSelectTab12
nmap <TAB>13 <Plug>AirlineSelectTab13
nmap <TAB>14 <Plug>AirlineSelectTab14
nmap <TAB>15 <Plug>AirlineSelectTab15
nmap <TAB>16 <Plug>AirlineSelectTab16
nmap <TAB>17 <Plug>AirlineSelectTab17
nmap <TAB>18 <Plug>AirlineSelectTab18
nmap <TAB>19 <Plug>AirlineSelectTab19
nmap <TAB>20 <Plug>AirlineSelectTab20
nmap <TAB>21 <Plug>AirlineSelectTab21
nmap <TAB>22 <Plug>AirlineSelectTab22
nmap <TAB>23 <Plug>AirlineSelectTab23
nmap <TAB>24 <Plug>AirlineSelectTab24
nmap <TAB>25 <Plug>AirlineSelectTab25
nmap <TAB>26 <Plug>AirlineSelectTab26
nmap <TAB>27 <Plug>AirlineSelectTab27
nmap <TAB>28 <Plug>AirlineSelectTab28
nmap <TAB>29 <Plug>AirlineSelectTab29
nmap <TAB>30 <Plug>AirlineSelectTab30
nmap <TAB>31 <Plug>AirlineSelectTab31
nmap <TAB>32 <Plug>AirlineSelectTab32
nmap <TAB>33 <Plug>AirlineSelectTab33
nmap <TAB>34 <Plug>AirlineSelectTab34
nmap <TAB>35 <Plug>AirlineSelectTab35
nmap <TAB>36 <Plug>AirlineSelectTab36
nmap <TAB>37 <Plug>AirlineSelectTab37
nmap <TAB>38 <Plug>AirlineSelectTab38
nmap <TAB>39 <Plug>AirlineSelectTab39
nmap <TAB>40 <Plug>AirlineSelectTab40
nmap <TAB>41 <Plug>AirlineSelectTab41
nmap <TAB>42 <Plug>AirlineSelectTab42
nmap <TAB>43 <Plug>AirlineSelectTab43
nmap <TAB>44 <Plug>AirlineSelectTab44
nmap <TAB>45 <Plug>AirlineSelectTab45
nmap <TAB>46 <Plug>AirlineSelectTab46
nmap <TAB>47 <Plug>AirlineSelectTab47
nmap <TAB>48 <Plug>AirlineSelectTab48
nmap <TAB>49 <Plug>AirlineSelectTab49
nmap <TAB>50 <Plug>AirlineSelectTab50
nmap <TAB>51 <Plug>AirlineSelectTab51
nmap <TAB>52 <Plug>AirlineSelectTab52
nmap <TAB>53 <Plug>AirlineSelectTab53
nmap <TAB>54 <Plug>AirlineSelectTab54
nmap <TAB>55 <Plug>AirlineSelectTab55
nmap <TAB>56 <Plug>AirlineSelectTab56
nmap <TAB>57 <Plug>AirlineSelectTab57
nmap <TAB>58 <Plug>AirlineSelectTab58
nmap <TAB>59 <Plug>AirlineSelectTab59
nmap <TAB>60 <Plug>AirlineSelectTab60
nmap <TAB>61 <Plug>AirlineSelectTab61
nmap <TAB>62 <Plug>AirlineSelectTab62
nmap <TAB>63 <Plug>AirlineSelectTab63
nmap <TAB>64 <Plug>AirlineSelectTab64
nmap <TAB>65 <Plug>AirlineSelectTab65
nmap <TAB>66 <Plug>AirlineSelectTab66
nmap <TAB>67 <Plug>AirlineSelectTab67
nmap <TAB>68 <Plug>AirlineSelectTab68
nmap <TAB>69 <Plug>AirlineSelectTab69
nmap <TAB>70 <Plug>AirlineSelectTab70
nmap <TAB>71 <Plug>AirlineSelectTab71
nmap <TAB>72 <Plug>AirlineSelectTab72
nmap <TAB>73 <Plug>AirlineSelectTab73
nmap <TAB>74 <Plug>AirlineSelectTab74
nmap <TAB>75 <Plug>AirlineSelectTab75
nmap <TAB>76 <Plug>AirlineSelectTab76
nmap <TAB>77 <Plug>AirlineSelectTab77
nmap <TAB>78 <Plug>AirlineSelectTab78
nmap <TAB>79 <Plug>AirlineSelectTab79
nmap <TAB>80 <Plug>AirlineSelectTab80
nmap <TAB>81 <Plug>AirlineSelectTab81
nmap <TAB>82 <Plug>AirlineSelectTab82
nmap <TAB>83 <Plug>AirlineSelectTab83
nmap <TAB>84 <Plug>AirlineSelectTab84
nmap <TAB>85 <Plug>AirlineSelectTab85
nmap <TAB>86 <Plug>AirlineSelectTab86
nmap <TAB>87 <Plug>AirlineSelectTab87
nmap <TAB>88 <Plug>AirlineSelectTab88
nmap <TAB>89 <Plug>AirlineSelectTab89
nmap <TAB>90 <Plug>AirlineSelectTab90
nmap <TAB>91 <Plug>AirlineSelectTab91
nmap <TAB>92 <Plug>AirlineSelectTab92
nmap <TAB>93 <Plug>AirlineSelectTab93
nmap <TAB>94 <Plug>AirlineSelectTab94
nmap <TAB>95 <Plug>AirlineSelectTab95
nmap <TAB>96 <Plug>AirlineSelectTab96
nmap <TAB>97 <Plug>AirlineSelectTab97
nmap <TAB>98 <Plug>AirlineSelectTab98
nmap <TAB>99 <Plug>AirlineSelectTab99
nmap <TAB><Left> <Plug>AirlineSelectPrevTab
nmap <TAB><Right> <Plug>AirlineSelectNextTab
let g:airline#extensions#tabline#keymap_ignored_filetypes=['taglist', 'nerdtree', 'srcexpl']	"define the set of filetypes which are ignored for the selectTab keymappings
let g:airline#extensions#tabline#fnamemod=':t'													"configure the formatting of filenames
let g:airline#extensions#tabline#show_close_button=1											"configure whether close button should be shown


""""""""""""" fzf setting
set rtp+=~/.fzf
nmap ff :exec 'cd' fnameescape(fnamemodify(finddir('.git', escape(expand('%:p:h'), ' ') . ';'), ':h')) \| :FZF<CR>


""""""""""""" cscope setting
" use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
if exists('&cscopetag')
	set cscopetag
endif

" check cscope for definition of a symbol before checking ctags: set to 1
" if you want the reverse search order.
if exists('&csto')
	set csto=0
endif

" add any cscope database in current directory
if filereadable("cscope.out")
	if exists(':cs')
		cs add cscope.out
	endif
" else add the database pointed to by environment variable
elseif $CSCOPE_DB != ""
	if exists(':cs')
		cs add $CSCOPE_DB
	endif
endif

" show msg when any other cscope db added
if exists('&cscopeverbose')
	set cscopeverbose
endif

" use quickfix window to show cscope results
if exists('&cscopequickfix')
	set cscopequickfix=s-,c-,t-,f-,i-
endif

""""""""""""" cscope/vim key mappings
"
" The following maps all invoke one of the following cscope search types:
"
"   's'   symbol: find all references to the token under cursor
"   'g'   global: find global definition(s) of the token under cursor
"   'c'   calls:  find all calls to the function name under cursor
"   't'   text:   find all instances of the text under cursor
"   'e'   egrep:  egrep search for the word under cursor
"   'f'   file:   open the filename under cursor
"   'i'   includes: find files that include the filename under cursor
"   'd'   called: find functions that function under cursor calls
"
" Below are three sets of the maps: one set that just jumps to your
" search result, one that splits the existing vim window horizontally and
" diplays your search result in the new window, and one that does the same
" thing, but does a vertical split instead (vim 6 only).
"
" All of the maps involving the <cfile> macro use '^<cfile>$': this is so
" that searches over '#include <time.h>" return only references to
" 'time.h', and not 'sys/time.h', etc. (by default cscope will return all
" files that contain 'time.h' as part of their name).


" To do the first type of search, hit 'CTRL-\', followed by one of the
" cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
" search will be displayed in the current window.  You can use CTRL-T to
" go back to where you were before the search.
"

nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>


" Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
" makes the vim window split horizontally, with search result displayed in
" the new window.
"
" (Note: earlier versions of vim may not have the :scs command, but it
" can be simulated roughly via:
"    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>

nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>


" Hitting CTRL-space *twice* before the search type does a vertical
" split instead of a horizontal one (vim 6 and up only)
"
" (Note: you may wish to put a 'set splitright' in your .vimrc
" if you prefer the new window on the right instead of the left

nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>
