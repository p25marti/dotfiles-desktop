#!/bin/python

import sys
import subprocess

def fix_string(string):
    # corrects encoding for the python version used
    if sys.version_info.major == 3:
        return string
    else:
        return string.encode('utf-8')

# Default parameters
output = fix_string(u'{artist}: {song}')
trunclen = 35

try:
    artist = subprocess.getoutput("playerctl metadata | grep artist | tr -s ' ' | cut -d' ' -f3-")
    song = subprocess.getoutput("playerctl metadata | grep title | tr -s ' ' | cut -d' ' -f3-")

    if not artist and not song:
        print('')
    else:
        if len(song) > trunclen:
            song = song[0:trunclen]
            song += '...'
            if ('(' in song) and (')' not in song):
                song += ')'

        print(": ".join([x for x in [artist, song] if x]))

except:
    print('')
