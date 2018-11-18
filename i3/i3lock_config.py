import subprocess
from os import system
from re import findall
from sys import argv

wallpaper = ''
if len(argv) > 1:
    output = subprocess.run(
        ['xdpyinfo'], stdout=subprocess.PIPE).stdout.decode()
    width, height = findall(
        '\\d+', ''.join(findall('dimensions:[\\W\\dx]+', output)))

    index_of_last_slash = argv[1].rfind('/') + 1

    # Split picture to name and path
    name_of_picture = argv[1][index_of_last_slash:]
    path_to_picture = argv[1][: index_of_last_slash]

    # Split name to name and file extention
    index_of_dot = name_of_picture.rfind('.')

    # Save name of the new, scaled picture
    scaled_picture = path_to_picture + \
        name_of_picture[:index_of_dot] + '_scaled' + \
        name_of_picture[index_of_dot:]

    # Scale the old picture
    system('convert -scale %sx%s %s %s' %
           (width, height, argv[1], scaled_picture))

    wallpaper = '-i %s ' % scaled_picture

name = 'i3lock'
flags = '-tefkn line-uses-inside'
additional_options = {
    'keylayout': 1,
    'radius': '15',
    'ring-width': 3,
    'refresh-rate': 0.00001,
    'noinputtext': 'Nothing to delete...',
    'datepos': '120:100',
    'datestr': '"%A, %d/%m/%Y"',
    'datecolor': 'ffffffff',
    'timecolor': 'ffffffff',
    'layoutcolor': 'ffffffff',

    'insidecolor': '373445ff',
    'keyhlcolor': 'd23c3dff',
    'insidevercolor': 'fecf4dff',
    'ringvercolor': 'ffffffff',

    'ringcolor': 'ffffffff',
    'bshlcolor': 'd23c3dff',
    'insidewrongcolor': 'd23c3dff',
    'ringwrongcolor': 'ffffffff',
    'veriftext': "",

    'separatorcolor': '00000000',
    'indpos': "120:700",
    'wrongtext': "",
}

command = '%s %s ' % (name, flags)
for key, value in additional_options.items():
    command += '--%s=%s ' % (key, value)

command += wallpaper

if len(argv) > 2:
    system(argv[2] + ' & ' + command)
else:
    system(command)
