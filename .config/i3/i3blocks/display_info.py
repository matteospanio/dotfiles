#!/usr/bin/python3

import subprocess
import dbus

subprocess.call("/home/benny/.config/i3/i3blocks/top.sh")
fo = open("log.txt", "r")
ciao = fo.readline()
#boolean = ciao.find('spot')
if not ciao:
    print("Spotify is off")
else:
    session_bus = dbus.SessionBus()
    spotify_bus = session_bus.get_object("org.mpris.MediaPlayer2.spotify", "/org/mpris/MediaPlayer2")
    spotify_properties = dbus.Interface(spotify_bus, "org.freedesktop.DBus.Properties")
    metadata = spotify_properties.Get("org.mpris.MediaPlayer2.Player", "Metadata")

    # The property Metadata behaves like a python dict
    #for key, value in metadata.items():
    #    print(key, value)

    # To just print the title
    print(metadata['xesam:title']+ " · "+metadata['xesam:artist'][0])

fo.close()

