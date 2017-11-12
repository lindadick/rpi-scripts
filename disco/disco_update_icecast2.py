# disco_update_icecast2
# 
# Should be configured to run after the Disco server starts up.

import urllib.parse
import urllib.request
import subprocess
import time

username = ""
password = ""
hostname = ""
port = ""
mountpoint = "/disco"
playlist_command = "disco --playlist"

while True:

	playlist = subprocess.check_output(playlist_command, shell=True, bufsize=1).decode("utf-8").split('\n')
	current = playlist[0].split(',')
	artist = urllib.parse.quote(current[1].replace('"', ''))
	song = urllib.parse.quote(current[2].replace('"', ''))

	url = "http://{:s}:{:s}/admin/metadata?mount={:s}&mode=updinfo&song={:s}+-+{:s}".format(hostname, port, mountpoint, artist, song)

	# From https://docs.python.org/3.1/howto/urllib2.html
	password_mgr = urllib.request.HTTPPasswordMgrWithDefaultRealm()
	top_level_url = url
	password_mgr.add_password(None, top_level_url, username, password)
	handler = urllib.request.HTTPBasicAuthHandler(password_mgr)
	opener = urllib.request.build_opener(handler)
	opener.open(url)
	urllib.request.install_opener(opener)

	time.sleep(5)
