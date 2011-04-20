" $Id$
"
" Description: Vim Perl Tweaks
"
" Copyright (C) 2005,2006 Charles Mauch <cmauch@gmail.com>
"
" Verbatim copying and distribution of this entire file is permitted in any
" medium without royalty provided this header is preserved.

setlocal cindent expandtab tabstop=4 shiftwidth=4
setlocal textwidth=80
setlocal cinkeys=0{,0},!^F,o,O,e " cink: Perl-friendly reindent keys
setlocal cinoptions=t0,+4,(0,)60,u0,*100 " cino: all sorts of options
setlocal cinwords=if,else,while,do,for,elsif,sub
setlocal formatoptions=crql " fo: word wrap, format comments
setlocal nosmartindent " nosi: Smart indent useless when C-indent is on
setlocal showmatch " show matches on parens, bracketc, etc.
setlocal iskeyword=48-57,_,A-Z,a-z,:
setlocal define=[^A-Za-z_]
