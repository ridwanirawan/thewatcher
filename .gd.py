import gdshortener
import os
ip = os.environ["NGROK_PUBLIC_URL"]
s = gdshortener.ISGDShortener()
print "Shorten URL :\n"
print s.shorten(url = 'https://{}' .format(ip))
os.system("python2 .listen.py")
