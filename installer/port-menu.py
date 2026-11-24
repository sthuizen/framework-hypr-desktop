"""Route package and boot management in the pinned Omarchy menu to Ubuntu."""
import json
from pathlib import Path
import sys

path = Path(sys.argv[1])
menu = json.loads('\n'.join(line for line in path.read_text().splitlines()
                            if not line.lstrip().startswith('//')).replace(',\n}', '\n}'))
# These upstream sections operate on Arch packages, Snapper and Limine.
for key in list(menu):
    if key.split('.')[0] in {'install', 'remove', 'update'} or key.startswith('setup.hibernation'):
        del menu[key]
menu.update({
    'setup.finish': {'label': 'Finish setup', 'action': 'finish-setup'},
    'update': {'label': 'Update'},
    'update.ubuntu': {'label': 'Ubuntu packages', 'action': 'foot --hold framework-update-system'},
    'update.codex': {'label': 'Codex CLI', 'action': 'foot --hold update-codex'},
})
path.write_text(json.dumps(menu, ensure_ascii=False, indent=2) + '\n')
