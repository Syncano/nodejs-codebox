#!/usr/bin/env python
import requests
from jinja2 import Template

MACHINEPACKS_URL = 'http://node-machine.org/machinepacks'

BLACK_LIST = {
    'machines-elasticsearch',  # not present
    'machinepack-assets',  # problem with installation
    'machinepack-weather',
    'machinepack-azure',
    'machinepack-mongodb',
    'machinepack-thumb',  # imagemagick
}


def get_machinepacks_set():
    r = requests.get(MACHINEPACKS_URL)
    packages = {i['npmPackageName'] for i in r.json()}
    return sorted(packages - BLACK_LIST)


if __name__ == '__main__':
    with open('package.json.j2', 'r') as f:
        template = Template(f.read())

    with open('package.json.v100', 'w+') as f:
        f.write(template.render(machinepacks=get_machinepacks_set()))
