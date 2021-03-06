" if there is no pyeval, we use this polyfill taken from
" https://github.com/google/vim-maktaba/issues/70#issue-35289378
if exists("*pyeval")
else
    if has("python")
        function! Pyeval(expr)
            python import json
            python vim.command('return '+json.dumps(eval(vim.eval('a:expr'))))
        endfunction
    else
        function! Pyeval(expr)
            python3 import json
            python3 vim.command('return '+json.dumps(eval(vim.eval('a:expr'))))
        endfunction
    endif
endif
