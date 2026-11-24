"""Apply the new-user profile to Omarchy's bundled shell configuration."""
import json
import sys
from pathlib import Path
path = Path(sys.argv[1])
shell = json.loads(path.read_text())
profiles = {
    'ac': dict(screensaver=600, lock=900, display=0, sleep=3600, sleepAction='suspend-then-hibernate'),
    'battery': dict(screensaver=180, lock=300, display=0, sleep=900, sleepAction='suspend-then-hibernate')
}
shell['idle'].update(screensaver=600, lock=900, sleepGuardian=dict(activeSource='ac', profiles=profiles))
layout = shell['bar']['layout']
for items in layout.values():
    items[:] = [i for i in items if i['id'] not in ('omarchy.system-update', 'omarchy.media')]
    for item in items:
        if item['id'] == 'omarchy.power':
            item['id'] = 'io.github.thenailedone.power-center'
layout['right'].append({'id': 'thenailedone.sleep-guardian'})
layout['center'].append({'id': 'io.github.thenailedone.media-deck'})
path.write_text(json.dumps(shell, indent=2) + '\n')
