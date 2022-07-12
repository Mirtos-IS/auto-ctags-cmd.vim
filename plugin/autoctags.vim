    if !exists(g:project_dir)
        let g:project_dir = 'src'
    endif

    function CtagsAsync(timer_id)
        let l:callbacks = {
                \ 'on_stdout': function('OnEvent'),
              \ }
        call jobstart(g:CtagsCmd(), l:callbacks)
    endfunction


    function OnEvent(job_id, data, event)
        if a:event == 'stdout'
            echo "Tags file saved on " . g:tags_dir

            call timer_start(30000, 'CtagsAsync')
        endif
    endfunction

    function g:CtagsCmd()
        let current_dir = expand('%:p:h')
        let g:tags_dir = substitute(current_dir, g:project_dir . '\zs.*$', '' , '' )
        let cmd = 'ctags -R ' . g:tags_dir
        return cmd
    endfunction

    function Ctags(project_dir = '')
        if exists(a:project_dir)
            let g:project_dir = a:project_dir
        endif
        call CtagsAsync(30000)
    endfunction
