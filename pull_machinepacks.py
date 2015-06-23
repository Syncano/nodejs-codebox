from bs4 import BeautifulSoup
from jinja2 import Template

html_doc = open('machinepacks.html').read()
soup = BeautifulSoup(html_doc)

urls = filter(lambda x: x is not None and 'http://node-machine.org/machinepack' in x, map(lambda x: x.get('href'), soup.find_all('a')))
packages = {url.replace('http://node-machine.org/', '') for url in urls}
blacklisted = {
    'machinepack-weather',
    'machinepack-azure',
    'machinepack-mongodb',
    'machinepack-thumb',  # imagemagick
}
packages -= blacklisted

for package in packages:
    print package

with open('package.json.j2', 'r') as f:
    template = Template(f.read())

with open('package.json', 'w+') as f:
    f.write(template.render(machinepacks=packages))
