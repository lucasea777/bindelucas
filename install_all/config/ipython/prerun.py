from IPython.core.magic import (register_line_magic, register_cell_magic,
                                register_line_cell_magic)

# @register_cell_magic
# def mm(args, cell):
#     print(cell)

@register_cell_magic
@register_line_magic
def m(line, body=None):
    """
    M = %m 1 3 4; 3 4 1; 4 3 2

    %%m M
    1 3 4
    3 4 1
    4 3 2
    """
    if body and body.strip():
        rows = body.strip().split("\n")
    else:
        rows = line.split(";")
    eval_rows = []
    for row in rows:
        eval_rows.append([eval(col) for col in row.split()])
    if not body:
        return sp.Matrix(eval_rows)
    else:
        globals()[line.strip()] = sp.Matrix(eval_rows)

@register_cell_magic
@register_line_magic
def a(line, body=None):
    """
    A = %a 1 3 4; 3 4 1; 4 3 2

    %%a A
    1 3 4
    3 4 1
    4 3 2
    """
    if body and body.strip():
        rows = body.strip().split("\n")
    else:
        rows = line.split(";")
    eval_rows = []
    for row in rows:
        eval_rows.append([eval(col) for col in row.split()])
    if not body:
        return np.array(eval_rows)
    else:
        globals()[line.strip()] = np.array(eval_rows)

# @register_cell_magic
@register_line_magic
def l(line, body=None):
    """
    L = %l 1 3 4
    """
    return [eval(c) for c in line.split()]


@register_line_magic
def cplast(line):
    last = list(get_ipython().history_manager.get_tail(1, raw=False))[0][-1]
    subprocess.Popen("xsel --clipboard --input".split(), stdin=subprocess.PIPE).communicate(bytes(last, "utf8"))

@register_line_magic
def copylast(line):
    cplast(line)

get_ipython().define_macro('load_sympy','from sympy.abc import *; from sympy import * ; init_printing()')
get_ipython().define_macro('killme','import os, signal; os.kill(os.getpid(), signal.SIGKILL)')

print("load_sympy might be useful 😊, Also ctrl+o adds a precious new line, Also _ is the last value!")