import libcst as cst
import libcst.matchers as m
from pathlib import Path
import os

import guake
# GUAKE_PATH = "/usr/lib/python3/dist-packages/guake/"
# GUAKE_PATH = Path("/home/luks/.local/lib/python3.6/site-packages/guake")
GUAKE_PATH = Path(os.path.abspath(guake.__file__)).parent
del guake

THIS_FILE_PATH = Path(__file__).absolute()
TERMINAL_PATH = "terminal.py"
KEYBINDINGS_PATH = "keybindings.py"
GUAKE_APP_PATH = "guake_app.py"

def backup(path):
    if not path.with_suffix('.backup').exists():
        path.with_suffix('.backup').write_text(path.read_text())

# load cst's
this_module = cst.parse_module(THIS_FILE_PATH.read_text())
this_classes = {c.name.value: c for c in m.findall(this_module, m.ClassDef())}
# Edit terminal.py
in_terminal_functions = m.findall(this_classes['InTerminal'], m.FunctionDef())
terminal_module = cst.parse_module((GUAKE_PATH / TERMINAL_PATH).read_text())
# add "import re" before first import
idx_of_first_import = next(i for i, imp in enumerate(terminal_module.body) if m.findall(imp, m.Import()))
terminal_module.body.insert(idx_of_first_import, cst.parse_statement("import re"))

# add methods in InTerminal to GuakeTerminal class in terminal.py
terminal_class = m.findall(terminal_module, m.ClassDef(name=m.Name('GuakeTerminal')))[0]
indented_block_in_terminal_class = terminal_class.body.body
indented_block_in_terminal_class.append(cst.Newline('\n'))
indented_block_in_terminal_class.extend(in_terminal_functions)
# Path('/tmp/out').write_text(terminal_module.code)
backup(GUAKE_PATH / TERMINAL_PATH)
Path(GUAKE_PATH / TERMINAL_PATH).write_text(terminal_module.code)

# Edit guake_app.py
in_guake_app_functions = m.findall(this_classes['InGuakeApp'], m.FunctionDef())
guake_app_module = cst.parse_module((GUAKE_PATH / GUAKE_APP_PATH).read_text())

guake_class = m.findall(guake_app_module, m.ClassDef(name=m.Name('Guake')))[0]
indented_block_in_guake_app_functions = guake_class.body.body
indented_block_in_guake_app_functions.append(cst.Newline('\n'))
indented_block_in_guake_app_functions.extend(in_guake_app_functions)
# Path('/tmp/out').write_text(guake_app_module.code)
backup(GUAKE_PATH / GUAKE_APP_PATH)
Path(GUAKE_PATH / GUAKE_APP_PATH).write_text(guake_app_module.code)

# Edit keybindings.py
keybindings_module = cst.parse_module((GUAKE_PATH / KEYBINDINGS_PATH).read_text())
code_to_add = this_classes['In_keybindings'].body.body[0].body.body
keybindings_class = m.findall(keybindings_module, m.ClassDef(name=m.Name('Keybindings')))[0]
load_accelerators_in_file = m.findall(keybindings_class, m.FunctionDef(name=m.Name('load_accelerators')))[0]
load_accelerators_in_file.body.body.append(cst.Newline('\n'))
load_accelerators_in_file.body.body.extend(code_to_add)
# Path('/tmp/out').write_text(keybindings_module.code)
backup(GUAKE_PATH / KEYBINDINGS_PATH)
Path(GUAKE_PATH / KEYBINDINGS_PATH).write_text(keybindings_module.code)
# print(cst.Module(terminal_module.body[:6]).code)
# import IPython; IPython.embed()

"import re"

class InTerminal():
    def match_deleting(self, txt):
        if txt[:2] == "  ":
            return len(txt) - len(txt.lstrip(" \t"))
        else:
            match = re.match(' *\\w+', txt)
            if not match:
                match = re.match(' *[^\\w\\s]+', txt)
            if match:
                return match.span()[1]
        return 0

    def ctrl_backspace(self): #luks 
        """
        Delete the entire word on the left of the cursor, or only trailing spaces if there are more than one:
            "$ hey soul sister  |" -> "hey soul sister|"
            "$ hey soul sister |" -> "hey soul |"
            "$ hey soul sister|"  -> "hey soul |"
            "$ 2pi is aprox 3.14+3.95|" -> "$ 2pi is aprox 3.14+3.|"
            "$ a+b | -> a+|"
        """
        col, row = self.get_cursor_position()
        txt = self.get_text_range(row, 0, row, col-1)[0]
        rev = "".join(reversed(txt))
        n_characters_to_delete = self.match_deleting(rev)
        tofeed = "\b" * n_characters_to_delete
        self.feed_child(tofeed)

    def del_times(self, times):
        for _ in range(times):
            e = Gdk.EventKey()
            # e.group = 0
            e.hardware_keycode = 119
            # e.is_modifier
            e.keyval = 65535
            # e.length = 1
            # e.send_event = 0
            # e.state
            # e.string = '\x7f' 
            # e.time
            e.type = Gdk.EventType.KEY_PRESS
            e.window = self.get_window()
            self.do_key_press_event(self, e)
            # e1 = e.copy()
            # e1.type = Gdk.EventType.KEY_RELEASE

    def ctrl_delete(self):
        col, row = self.get_cursor_position()
        txt = self.get_text_range(row, col, row, self.get_column_count())[0]
        n_characters_to_delete = self.match_deleting(txt)
        self.del_times(n_characters_to_delete)

class In_keybindings():
    def in_load_accelerators(self):
        from gi.repository import Gdk #luks! lucas
        key, mask = Gdk.KEY_BackSpace, Gdk.ModifierType.CONTROL_MASK #luks lucas
        if key > 0: #luks lucas
            self.accel_group.connect(
                key, mask, Gtk.AccelFlags.VISIBLE, self.guake.accel_ctrl_backspace
            )

        key, mask = Gdk.KEY_Delete, Gdk.ModifierType.CONTROL_MASK #luks lucas
        if key > 0: #luks lucas
            self.accel_group.connect(
                key, mask, Gtk.AccelFlags.VISIBLE, self.guake.accel_ctrl_delete
            )

class InGuakeApp():
    def accel_ctrl_backspace(self, *args): #luks lucas
        self.notebook_manager.get_current_notebook().get_current_terminal().ctrl_backspace()
        return True

    def accel_ctrl_delete(self, *args): #luks lucas
        self.notebook_manager.get_current_notebook().get_current_terminal().ctrl_delete()
        return True