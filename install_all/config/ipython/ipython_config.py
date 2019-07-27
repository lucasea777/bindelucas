c = get_config()

modules = """
math math
plt matplotlib.pyplot
ks keras
np numpy
numpy numpy
sp sympy
sympy sympy
os os
sys sys
json json
time time
sys sys
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

c.InteractiveShellApp.exec_lines = [
    'import lazy_import\n'
] + ["\n".join([f"{line.split()[0]} = lazy_import.lazy_module(\"{line.split()[1]}\")" for line in modules])] \
  + ["\n".join([f"{line.split()[0]} = lazy_import.lazy_callable(\"{line.split()[1]}\")" for line in callables])]

c.InteractiveShellApp.exec_files = ['/home/luks/.ipython/profile_default/prerun.py']