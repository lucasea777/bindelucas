c = get_config()

modules = """
math math
plt matplotlib.pyplot
matplotlib matplotlib
pd pandas
requests requests
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
defaultdict collections.defaultdict
Path pathlib.Path
Matrix sympy.Matrix
array numpy.array
""".strip().split("\n")

lazys = []
for short_mod, mod in map(str.split, modules):
    lazys.append(f"{short_mod} = lazy_import.lazy_module('{mod}')")
for short_callable, callable in map(str.split, callables):
    lazys.append(f"{short_callable} = lazy_import.lazy_callable('{callable}')")
# lazys = ";".join(lazys)
lazys = "\n        ".join(lazys)

# https://stackoverflow.com/questions/15411967/how-can-i-check-if-code-is-executed-in-the-ipython-notebook
c.InteractiveShellApp.exec_lines = [f"""
try:
    if get_ipython().__class__.__name__ == "TerminalInteractiveShell":
        import lazy_import
        {lazys}
    else:
        pass
except Exception:
    pass
"""]
# print(c.InteractiveShellApp.exec_lines[0])

c.InteractiveShellApp.exec_files = ['/home/luks/.ipython/profile_default/prerun.py']