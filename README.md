README
========================================================
<h2>First case</h2>
First we will see a little artificial example to see how to use the program

First load the script avaliable in "http://bass.uib.es/~ppin/Scripts/PINTS.R"

```r
source("http://bass.uib.es/~ppin/Scripts/PINTS.R")
```

```
## Loading required package: igraph
## Loading required package: clue
## Loading required package: parallel
```


Then you have to create the networks and the similarity matrix, the format of the networks must be list of edges separated by tab and the similirity matrix must be a list of values, i. e.

<pre>node_network1\tnode_network2\tvalue</pre>

You can found a little example of networks and similarity matrix in http://bass.uib.es/~ppin/Files/Example

Finally we can execute the program

```r
net1 = "http://bass.uib.es/~ppin/Files/Example/NetExample1.txt"
net2 = "http://bass.uib.es/~ppin/Files/Example/NetExample2.txt"
similarity.matrix = "http://bass.uib.es/~ppin/Files/Example/SimilarityMatrixExample.txt"
alin = pints(net1, net2, similarity.matrix, verbose = TRUE)
alin
```

```
## [1] "DATA LOADED"
## [1] "START BUILDING SIMILARITY MATRIX"
## [1] "SIMILARITY MATRIX BUILDED"
## [1] "Number of iterations :5"
## [1] "Iteration :1"
## [1] "Iteration :2"
## [1] "Iteration :3"
## [1] "Iteration :4"
## [1] "Iteration :5"
## [1] "DONE"
```

```
##      [,1] [,2]
## [1,] "a1" "b1"
## [2,] "a2" "b2"
## [3,] "a5" "b6"
## [4,] "a3" "b3"
## [5,] "a4" "b4"
## [6,] "a6" "b5"
```


If the networks are small you can see the alignment

```r
source("http://bass.uib.es/~ppin/Scripts/Auxiliar.R")
source("http://bass.uib.es/~ppin/Scripts/plotAlignment.R")

Gnet1 = makeGnet(net1)
Gnet2 = makeGnet(net2)
plotGraph(Gnet1, color = "green")
```

![plot of chunk plotExample](figure/plotExample1.png) 

```r
plotGraph(Gnet2, color = "red")
```

![plot of chunk plotExample](figure/plotExample2.png) 

```r
plotAlignment(Gnet1, Gnet2, alin)
```

![plot of chunk plotExample](figure/plotExample3.png) 


Now we have the alignment we can calculate the ECScore, for this we need two more scripts (avaliables in http://bass.uib.es/~ppin/Scripts)

```r
source("http://bass.uib.es/~ppin/Scripts/CreaScores.R")
ECscore(Gnet1, Gnet2, alin)
```

```
## [1] 0.6
```


<h2>Real case 1</h2>

First load all necessary scripts

```r
source("http://bass.uib.es/~ppin/Scripts/PINTS.R")
source("http://bass.uib.es/~ppin/Scripts/CreaScores.R")
source("http://bass.uib.es/~ppin/Scripts/Auxiliar.R")
```


Calculate the alignment, net1, net2 and similarity.matrix must be directories.


```r
net1 = "http://bass.uib.es/~ppin/Files/Nets/RnorvAdria.txt"
net2 = "http://bass.uib.es/~ppin/Files/Nets/HpyloAdria.txt"
similarity.matrix = "http://bass.uib.es/~ppin/Files/matrius/RnorvHpylo.blast"

alin = pints(net1, net2, similarity.matrix)
```





The alignment is a two-column table, like this

```r
head(alin)
```

```
##      [,1]         [,2]       
## [1,] "DIP-60188N" "DIP-3531N"
## [2,] "DIP-5717N"  "DIP-3146N"
## [3,] "DIP-29227N" "DIP-3598N"
## [4,] "DIP-33299N" "DIP-3438N"
## [5,] "DIP-48643N" "DIP-3481N"
## [6,] "DIP-6073N"  "DIP-3742N"
```

In this case we barely see anything

```r
Gnet1 = makeGnet(net1)
Gnet2 = makeGnet(net2)
plotGraph(Gnet1, color = "green")
```

![plot of chunk plotReal1](figure/plotReal11.png) 

```r
plotGraph(Gnet2, color = "red")
```

![plot of chunk plotReal1](figure/plotReal12.png) 

```r
plotAlignment(Gnet1, Gnet2, alin)
```

![plot of chunk plotReal1](figure/plotReal13.png) 


Once you have the alignment you can calculate several scores, for example, ECScore

```r
ECscore(Gnet1, Gnet2, alin)
```

```
## [1] 0.2926
```


Finally if your proteins are in DIP format you can calculate the FCscore

```r
specie1 = "Rnorv"
specie2 = "Hpylo"
FCScore(alin, specie1, specie2)
```

```
## [1] 0.04395
```


The species avaliables are Rnorv,Hpylo, Mmusc, Cel, Eco, Hsapi, sce and Dme ( you can found information about the PPIN of this species in http://bass.uib.es/~ppin/Info)

<h2>Real case 2</h2>

First load all necessary scripts

```r
source("http://bass.uib.es/~ppin/Scripts/PINTS.R")
source("http://bass.uib.es/~ppin/Scripts/CreaScores.R")
source("http://bass.uib.es/~ppin/Scripts/Auxiliar.R")
```


Calculate the alignment, net1, net2 and similarity.matrix must be directories.


```r
net1 = "http://bass.uib.es/~ppin/Files/Nets/sceAdria.txt"
net2 = "http://bass.uib.es/~ppin/Files/Nets/DmeAdria.txt"
similarity.matrix = "http://bass.uib.es/~ppin/Files/matrius/sceDme.blast"

alin = pints(net1, net2, similarity.matrix)
```





The alignment is a two-column table, like this

```r
head(alin)
```

```
##      [,1]        [,2]        
## [1,] "DIP-1422N" "DIP-21022N"
## [2,] "DIP-837N"  "DIP-17232N"
## [3,] "DIP-5229N" "DIP-23652N"
## [4,] "DIP-1823N" "DIP-18336N"
## [5,] "DIP-5699N" "DIP-18751N"
## [6,] "DIP-5489N" "DIP-19686N"
```

In this case we see anything

```r
Gnet1 = makeGnet(net1)
Gnet2 = makeGnet(net2)
plotGraph(Gnet1, color = "green")
```

![plot of chunk plotReal2](figure/plotReal21.png) 

```r
plotGraph(Gnet2, color = "red")
```

![plot of chunk plotReal2](figure/plotReal22.png) 

```r
plotAlignment(Gnet1, Gnet2, alin)
```

![plot of chunk plotReal2](figure/plotReal23.png) 


Once you have the alignment you can calculate several scores, for example, ECScore

```r
ECscore(Gnet1, Gnet2, alin)
```

```
## [1] 0.07919
```


Finally if your proteins are in DIP format you can calculate the FCscore

```r
specie1 = "sce"
specie2 = "Dme"
FCScore(alin, specie1, specie2)
```

```
## [1] 0.07345
```

