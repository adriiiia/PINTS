source("Scripts/Auxiliar.R")
library("R.utils")
FCScore = function(alin,nom1,nom2){
  aux=alin
  load(paste("Files//FCScore/GO",nom1,".RData",sep=""))
  GO1 =go[aux[,1]]
  load(paste("Files//FCScore/GO",nom2,".RData",sep=""))
  GO2=go[aux[,2]]
  iii = lapply(mapply(intersect,GO1,GO2),length)
  uuu = lapply(mapply(union,GO1,GO2),length)
  div=mapply(FUN=function(x,y) return(x/y),iii,uuu)
  sss=sum(div)
  sss=sum(div[which(!is.na(div))])
  return(sss/length(which(div>0)))
  
}
ECscore=function(Gnet1,Gnet2,alin){
  aaaa=alin[,2]
  names(aaaa)=alin[,1]
  alini= function(x,y){matrix(c(as.character(aaaa[x])
                                ,as.character(aaaa[y])),nrow=1)}
  E1=get.edgelist(Gnet1)
  eds=t(mapply(alini,E1[,1],E1[,2]))
  Gnet3=graph.edgelist(eds,directed=FALSE)
  ggg4=graph.intersection.by.name(Gnet3,Gnet2)
  #print(get.edgelist(ggg4))
  return(length(E(ggg4))/min(length(E(Gnet1)),length(E(Gnet2))))
}


creaScore = function(nom1,nom2){
  net1 = paste("Files/Nets/",nom1,"Adria.txt",sep="")
  net2 = paste("Files/Nets/",nom2,"Adria.txt",sep="")
  Gnet1 = makeGnet(net1)
  Gnet2 = makeGnet(net2)
  aPINTS=paste("Results/Alin",nom1,nom2,".RData",sep="")
  if(isFile(aPINTS)){
    load(aPINTS)
    alinPINTS = alin
    aPISWAP=paste("Results/piswap_",nom1,nom2,".txt",sep="")
    piswapEC = 0
    piswapFC = 0  

    if(isFile(aPISWAP)){
      alinPISWAP = as.matrix(read.table(aPISWAP,sep="\t"))
      alinPISWAP[,1]=sub(nom1,"DIP-",alinPISWAP[,1])
      alinPISWAP[,2]=sub(nom2,"DIP-",alinPISWAP[,2])
      piswapEC = ECscore(Gnet1,Gnet2,alinPISWAP)
      piswapFC = FCScore(alinPISWAP,nom1,nom2)  
      
    }
  pintsEC = ECscore(Gnet1,Gnet2,alinPINTS)
  pintsFC = FCScore(alinPINTS,nom1,nom2)
  save(pintsEC,pintsFC,piswapEC,piswapFC,file=paste("Results//Scores",nom1,nom2,".RData",sep=""))
}
  }

creaScore2 = function(nom1,nom2){
  net1 = paste("Files/Nets/",nom1,"Adria.txt",sep="")
  net2 = paste("Files/Nets/",nom2,"Adria.txt",sep="")
  Gnet1 = makeGnet(net1)
  Gnet2 = makeGnet(net2)
  load(paste("Results/Alin",nom1,nom2,".RData",sep=""))
  alinPINTS = alin
  #alinPISWAP = as.matrix(read.table(paste("Results/piswap_",nom1,nom2,".txt",sep=""),sep="\t"))
  #alinPISWAP[,1]=sub(nom1,"DIP-",alinPISWAP[,1])
  #alinPISWAP[,2]=sub(nom2,"DIP-",alinPISWAP[,2])
  pintsEC = ECscore(Gnet1,Gnet2,alinPINTS)
  pintsFC = FCScore(alinPINTS,nom1,nom2)
  #piswapEC = ECscore(Gnet1,Gnet2,alinPISWAP)
  #piswapFC = FCScore(alinPISWAP,nom1,nom2)  
  piswapEC=0
  piswapFC=0
  save(pintsEC,pintsFC,piswapEC,piswapFC,file=paste("Results//Scores",nom1,nom2,".RData",sep=""))
}

creaScore("Hpylo","Cel")
