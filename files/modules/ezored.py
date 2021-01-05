"""Module: Ezored"""

import colorama
from files.modules import command


# -----------------------------------------------------------------------------
def run(proj_path, args):
    colorama.init()
    command.process_command(proj_path, args[1:])
