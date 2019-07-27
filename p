#!/usr/bin/env python3

import sys
import lazy_import
import os

# si no se pasan argumentos, ejecutar ipython3
if len(sys.argv) <= 1:
    print("Ningun argumento -> ejecutar ipython3")
    os.system("ipython3")
    sys.exit()

modules = """
plt matplotlib.pyplot
ks keras
np numpy
numpy numpy
sp sympy
sympy sympy
json json
time time
tf tensorflow
pickle pickle
K keras.backend
re regex
subprocess subprocess
""".strip().split("\n")

callables = """
Path pathlib.Path
Matrix sympy.Matrix
array numpy.array
""".strip().split("\n")

for line in modules:
    globals()[line.split()[0]] = lazy_import.lazy_module(line.split()[1])

for line in callables:
    globals()[line.split()[0]] = lazy_import.lazy_callable(line.split()[1])

import math
import ast
code = " ".join(sys.argv[1:])
tree = ast.parse(code)
if len(tree.body) == 1:
    print(eval(code))
elif type(tree.body[-1]) == ast.Expr:
    ultima_exp = tree.body[-1]
    del tree.body[-1]
    exec(compile(tree, filename="<ast>", mode="exec"))
    print(eval(compile(ast.Expression(ultima_exp.value), filename="<ast>", mode="eval")))
else:
    exec(compile(tree, filename="<ast>", mode="exec"))
# print(eval())
# import IPython; IPython.embed()