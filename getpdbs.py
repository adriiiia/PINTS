import sys
import os
def getpdbs(nom):
	fit = open("PDB"+nom+".txt")
	lin = fit.readlines()
	fit.close()
	lin2 = [i.replace("\"","") for i in lin]
	lin2 = [i.split("\t") for i in lin2]
	lin3 = [[i,j.split("-")[0]] for i,j in lin2]
	lin4 = [[i,j.split("\n")[0]] for i,j in lin3]
	for i,pdb in lin4:
		getpdb(pdb,nom)
	lin5 = ["\t".join(i)+"\n" for i in lin4]
	fit = open("PDB"+nom+"2.txt",'w')
	fit.writelines(lin5)
	fit.close()


def getpdb(pdb,nom):
	os.system("wget http://www.rcsb.org/pdb/files/"+pdb+".pdb -O PDB"+nom+"/"+pdb+".pdb")

getpdbs(sys.argv[1])
