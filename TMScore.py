import os
import sys
def getTMscore(nom1,nom2,piswap):
	if piswap==5:
		#print piswap,0
		fit = open("AlinPDB"+nom1+nom2+"_PISWAP.txt")
		lin = fit.readlines()
		fit.close()
	else:
		if piswap==1:
	 #		print piswap,1
			fit = open("AlinPDB"+nom1+nom2+".txt")
			lin = fit.readlines()
			fit.close()
		else:
			if piswap==6:
	#			print piswap,2
				fit = open("AlinPDB"+nom1+nom2+"_ISO.txt")
				lin = fit.readlines()
				fit.close()
			else:
				if piswap==7:
					fit = open("AlinPDB"+nom1+nom2+"_NETAL.txt")
					lin = fit.readlines()
					fit.close()
				else:
					fit = open("AlinPDB"+nom1+nom2+"_"+repr(piswap)+".txt")
					lin = fit.readlines()
					fit.close()


	lin2 = [i.replace("\"","") for i in lin]
	lin2 = [i.split("\t") for i in lin2]
	if len(lin2)==0:
		print 0
		return(0)
	if len(lin2[0])<2:
		lin4 = [[lin2[0][0].split("\n")[0],lin2[1][0].split("\n")[0]]]
	else:
		lin3 = [[i,j.split("-")[0]] for i,j in lin2]
		lin4 = [[i,j.split("\n")[0]] for i,j in lin3]
	cont = 1
	TM=0
	for p1,p2 in lin4:
		sortida = "tmp.txt"
		os.system("TMalign PDB"+nom1+"/"+p1+".pdb PDB"+nom2+"/"+p2+".pdb -a> "+sortida)
		fit = open(sortida)
		lin = fit.readlines()
		fit.close()
		TM+=float(lin[15].split("=")[1].split("(")[0])
		cont+=1
	print TM/cont
getTMscore(sys.argv[1],sys.argv[2],int(sys.argv[3]))