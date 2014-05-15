require("igraph")
require("clue")
require("parallel")
#pints function
#dir1 : directory of network1
#dir2 : directory of network2
#dir3 : directory of initial matrix
pints = function(dir1,dir2,dir3,verbose=FALSE){
  #LOAD DATA
  S=read.table(dir3,sep="\t")
  net1 = read.table(dir1,sep="\t")
  net2 = read.table(dir2,sep="\t")
  if(verbose){
	print("DATA LOADED")
	}
  
  #Create graphs without loops
  Gnet1 = simplify(graph.data.frame(net1, directed=F))
  #Gnet1=induced.subgraph(Gnet1,which(eccentricity(Gnet1)!=0))
  nodesnet1=V(Gnet1)$name
  Gnet2 = simplify(graph.data.frame(net2, directed=F))
  #Gnet2=induced.subgraph(Gnet2,which(eccentricity(Gnet2)!=0))
  nodesnet2=V(Gnet2)$name
  
  #Initial similarity matrix with labels the node labels
  #net1xnet2 only similarity>0
  #Create initial matrix with the same order labels
  M=matrix(0,nrow=length(nodesnet1),ncol=length(nodesnet2))
  dimnames(M)=list(nodesnet1,nodesnet2)
  if(verbose){
	print("START BUILDING SIMILARITY MATRIX")
	}
  #Create the similarity matrix for all entries
  mmm = mapply(FUN=function(x,y,z)M[as.character(x),as.character(y)]<<-z,S[,1],S[,2],S[,3])
  n1e0=which(eccentricity(Gnet1)==0)
  n2e0=which(eccentricity(Gnet2)==0)
  if(!(length(n1e0)+length(n2e0)==0)){
  M=M[-n1e0,-n2e0]
  }
  if(verbose){
	print("SIMILARITY MATRIX BUILDED")
	}
  
  Gnet1=induced.subgraph(Gnet1,which(eccentricity(Gnet1)!=0))
  Gnet2=induced.subgraph(Gnet2,which(eccentricity(Gnet2)!=0))
  nodesnet1=V(Gnet1)$name
  nodesnet2=V(Gnet2)$name
 
 diam=max(diameter(Gnet1),diameter(Gnet2))
  if(verbose){
  print(paste("Number of iterations :",diam,sep="")) 
  }  
  
  #Reorder the labels of similarity sdame order labels net1 net2
  auxf=function(x,l=V(Gnet1)$name) which(l==x)
  R1=unlist(lapply(dimnames(M)[[1]],FUN=auxf))
  auxf=function(x,l=V(Gnet2)$name) which(l==x)
  R2=unlist(lapply(dimnames(M)[[2]],FUN=auxf))
  
  #Reordered similarity matrix M
  M=M[R1,R2]
  auxnet=function(x,G=Gnet1) neighbors(G,x)
  neigh.Gnet1=lapply(V(Gnet1),FUN=auxnet)
  auxnet=function(x,G=Gnet2) neighbors(G,x)
  neigh.Gnet2=lapply(V(Gnet2),FUN=auxnet)
  #print("Ha llegit")
  
  #####Define matching function
  
  n1 = length(V(Gnet1))
  n2 = length(V(Gnet2))
  matching = function(x,y){
    #Make submatrix
    neigh1 = neigh.Gnet1[x][[1]]
    neigh2 = neigh.Gnet2[y][[1]]
    n1 = length(neigh1)
    n2 = length(neigh2)
    if(n1*n2==0) return(c(y,M[x,y]))
    SubM = M[neigh1,neigh2]
    #Check trivial case
    if(is.null(dim(SubM))) return(c(y,M[x,y]+max(SubM)/max(n1,n2)))
    #Check dimensions we need rows<columns
    if(dim(SubM)[2]<dim(SubM)[1]) SubM=t(SubM)
    match=solve_LSAP(SubM,maximum=T)
    return(c(y,M[x,y]+sum(SubM[cbind(seq_along(match),match)])/max(n1,n2)))
  }
  
  #Apply the function matching to all pairs of proteins
  #in parallel
  acti  <-function(x){
    return(list(x,mcmapply(matching,c(x:x),c(1:n2))))
  }
  actualitzar = function(v){
    M[v[[1]],v[[2]][1,]]<<-v[[2]][2,]
  }
 
  for(i in 1:diam){
	if(verbose){
    print(paste("Iteration :",i,sep=""))
	}    
    auxiliar=mclapply(c(1:n1),acti,mc.allow.recursive=True)
    aaa=lapply(auxiliar,actualitzar)
    M=M/max(M)
  }
  
  alin = solve_LSAP(M,maximum=T)
  if(verbose){
	print("DONE")
  }
  return(cbind(nodesnet1[seq_along(alin)],nodesnet2[alin]))
  
}

