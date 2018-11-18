#!/usr/bin/python

import subprocess
from os import system
from time import sleep


def main():
    dropdowns = {'dropdown_terminal': '',
                 'dropdown_ranger': 'ranger -c /home/lidor/',
                 'dropdown_python': '/usr/bin/python3.6 /usr/bin/ipython',
            }

    while True:
        output = subprocess.run("""wmctrl -l | awk "/dropdown/{print \$4}" | grep -v wmctrl""", shell=True, stdout=subprocess.PIPE)
        output = [i for i in output.stdout.decode().split('\n') if i]

        for i in dropdowns.keys() - set(output):
            if dropdowns[i]:
                system(f"termite -d /home/lidor/tmp -t {i} -e '{dropdowns[i]}' & disown")
            else:
                system(f"termite -d /home/lidor/tmp -t {i} & disown")

        sleep(5)


if __name__ == '__main__':
    main()

