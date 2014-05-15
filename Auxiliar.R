library("igraph")
###Auxiliar functions
makeGnet = function(dir){
  net = read.table(dir,sep="\t")
  net = simplify(graph.data.frame(net, directed=F))
  net = induced.subgraph(net,which(eccentricity(net)!=0))
  return(net)
  
}

loadalin = function(dir){
  load(dir)
  return(alin)
}