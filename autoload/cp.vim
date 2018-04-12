function! cp#NextTest()
    write
    let ext = expand("%:t:e")
    let index = expand("%:t:r")

    if ext == "cpp"
        edit 0.in
    else
        if ext == "in"
            let ext = "out"
        else
            let ext = "in"
            let index = string(index + 1)
        endif
        execute "edit " . index . "." . ext
    endif
endfunction

function! cp#PreviousTest()
    write
    let ext = expand("%:t:e")
    let index = expand("%:t:r")

    if expand("%") == "0.in"
        edit solution.cpp
    else
        if ext == "in"
            let ext = "out"
            let index = string(index - 1)
        else
            let ext = "in"
        endif
        execute "edit " . index . "." . ext
    endif
endfunction

function! cp#GoToSolution()
    write
    let s:last_test = expand("%")
    edit solution.cpp
endfunction

function! cp#GoToLastTest()
    write
    execute "edit " . s:last_test
endfunction
