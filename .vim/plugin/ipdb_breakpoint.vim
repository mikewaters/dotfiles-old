" Author: Bernardo Fontes <falecomigo@bernardofontes.net>
" Website: http://www.bernardofontes.net
" This code is based on this one: http://www.cmdln.org/wp-content/uploads/2008/10/python_ipdb.vim
" I worked with refactoring and it simplifies a lot the remove breakpoint feature.
" To use this feature, you just need to copy and paste the content of this file at your .vimrc file! Enjoy!
python << EOF
import vim
import re

ipdb_breakpoint = 'import ipdb; ipdb.set_trace()'

def set_breakpoint():
    breakpoint_line = int(vim.eval('line(".")')) - 1

    current_line = vim.current.line
    white_spaces = re.search('^(\s*)', current_line).group(1)

    vim.current.buffer.append(white_spaces + ipdb_breakpoint, breakpoint_line)

vim.command('map <f6> :py set_breakpoint()<cr>')

def remove_breakpoints():
    op = 'g/^.*%s.*/d' % ipdb_breakpoint
    vim.command(op)

vim.command('map <f7> :py remove_breakpoints()<cr>')
EOF
