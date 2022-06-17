#!/usr/bin/env bash

HERE="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"
cd $HERE/..

echo '这里调用plenary    /home/wf/.local/share/nvim/PL/tree_sitter-nvim/scripts/run_tests.sh'

run() {
        echo '这里调用plenary.  准备run'
        nvim --headless --noplugin -u scripts/minimal_init.lua \
            -c "PlenaryBustedDirectory $1 { minimal_init = './scripts/minimal_init.lua' }"
        }

if [[ $2 = '--summary' ]]; then
    ## really simple results summary by filtering plenary busted output
    run tests/$1  2> /dev/null | grep -E '^\S*(Success|Fail(ed)?|Errors?)\s*:'
else
    run tests/$1
fi
