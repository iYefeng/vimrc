map <F4> ms:call AddAuthor()<cr>'s

function AddAuthor()
    let n=1
    while n < 13
        let line = getline(n)
        if line=~'[#]*\s*\*\s*\S*Last\s*modified\s*:\s*\S*.*$'
            call UpdateTitle()
            return
        endif
        let n = n + 1
    endwhile
    if &filetype == 'sh'
        call AddTitleForShell()
    elseif &filetype == 'python'
        call AddTitleForPython()
    else
        call AddTitleForC()
    endif
endfunction


function UpdateTitle()
    normal m'
    execute '/* Last modified\s*:/s@:.*$@\=strftime(": %Y-%m-%d %H:%M")@'
    normal mk
    execute '/* Filename\s*:/s@:.*$@\=": ".expand("%:t")@'
    execute "noh"
    normal 'k
    echohl WarningMsg | echo "Successful in updating the copyright." | echohl None
endfunction

function AddTitleForC()
    call append(0,"/************************************************************")
    call append(1," * Use of this source code is governed by a BSD-style license")
    call append(2," * that can be found in the License file.")
    call append(3," * ")
    call append(4," * Author        : yefeng")
    call append(5," * Email         : yefeng38083120@126.com")
    call append(6," * Create time   : ".strftime("%Y-%m-%d %H:%M"))
    call append(7," * Last modified : ".strftime("%Y-%m-%d %H:%M"))
    call append(8," * Filename      : ".expand("%:t"))
    call append(9," * Description   : ")
    call append(10," * *********************************************************/")
    echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endfunction

"" add comment for Python
function AddTitleForPython()
    call append(0,"#!/usr/bin/env python")
    call append(1,"# -*- coding: UTF-8 -*-")
    call append(2,"")
    call append(3,"# ************************************************************")
    call append(4,"# * Use of this source code is governed by a BSD-style license")
    call append(5,"# * that can be found in the License file.")
    call append(6,"# * ")
    call append(7,"# * Author        : yefeng")
    call append(8,"# * Email         : yefeng38083120@126.com")
    call append(9,"# * Create time   : ".strftime("%Y-%m-%d %H:%M"))
    call append(10,"# * Last modified : ".strftime("%Y-%m-%d %H:%M"))
    call append(11,"# * Filename      : ".expand("%:t"))
    call append(12,"# * Description   : ")
    call append(13,"# ************************************************************")
    echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endfunction

"" add conment for shell
function AddTitleForShell()
    call append(0,"#!/bin/bash")
    call append(1,"# ************************************************************")
    call append(2,"# * Use of this source code is governed by a BSD-style license")
    call append(3,"# * that can be found in the License file.")
    call append(4,"# * ")
    call append(5,"# * Author        : yefeng")
    call append(6,"# * Email         : yefeng38083120@126.com")
    call append(7,"# * Create time   : ".strftime("%Y-%m-%d %H:%M"))
    call append(8,"# * Last modified : ".strftime("%Y-%m-%d %H:%M"))
    call append(9,"# * Filename      : ".expand("%:t"))
    call append(10,"# * Description   : ")
    call append(11,"# ************************************************************")
    echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endfunction
