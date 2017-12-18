#!/usr/bin/python
import os
import json
import types

Jenkin_WS="/var/lib/jenkins/workspace/MetrolabDockerTest"
with open("MetroLab.json","r") as f:
  d = json.load(f)

print(d)
print("\n\n")
#print(d["modules"])  # will return 'blabla'
#print("\n\n")
def deploy_puppet():
	#for x in d:
	#print "************************\n\n"
	#print "Printing x out"
	#print x
	#print "Done Printing x out"
	#print "************************\n\n"

	print("Process Puppet  modules\n\n")
	for i in d["modules"]:
		mod_Name = i["module"]
		dest = i["destination"]
		fileName = i["fname"]
		homeDir = i["home_dir"]
		source_dir = i["source_dir"]
		pup_type = i["type"]
		print("Mod Name = " + mod_Name +"\n Destination Dir =" + dest + "\n homeDir ="+ homeDir + "\n FileName =" +fileName + "\nsource Dir = " + source_dir + "\n")
		print("Processing  Module " + mod_Name)
		if i["module"] in  ["site"]:
			#print("cp -r " + source_dir + "/" + homeDir + "/"+fileName + " " + dest + "/" + pup_type +  "/") 
			cmd="cp -r " + source_dir + "/" + homeDir + "/"+fileName + " " + dest + "/" + pup_type +  "/"
			print (cmd)
		else: 
			#print("cp -r " + source_dir + "/" + homeDir + "/" + " " + dest + "/" + pup_type +  "/"  )
			cmd="cp -r " + source_dir + "/" + homeDir + "/" + " " + dest + "/" + pup_type +  "/" 
			print (cmd)
	
		print("*********\n\n")
		DIR = source_dir + "/" + homeDir 
		print("DIR + " + DIR)
		#if os.path.dirname(source_dir + "/" + homeDir +"d"):
		if os.path.exists(DIR):
			print(  source_dir + "/" + homeDir + " EXIST")
			print("Running .....\n" + cmd)
			os.system(cmd)
		else:
			print("***************ERROR:" + DIR +" Directory does not exist ******\n")

######## End Puppet Procedure ##########
#
#
#
# Process Docker Container

def deploy_container():
	for i in d["container"]:
		dest = i["destination"]
		homeDir = i["home_dir"]
		source_dir = i["source_dir"]
		_type = i["type"]
		mod_Name = i["module"]
		#fileName = i["fname"]
		print("Mod Name = " + mod_Name +"\n Destination Dir =" + dest + "\n homeDir ="+ homeDir +  "\nsource Dir = " + source_dir + "\n")
		cmd="cp -r " + source_dir + "/" + mod_Name + " " + dest 
		print (cmd)
		os.system(cmd)
#
####### End deploy_container ########

deploy_container()
deploy_puppet()
