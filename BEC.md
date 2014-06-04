EC with FC
========================================================

```r
load("BEC.RData")
```


% Conserved Edges with FC < 0.1

```r
mmm = as.table(BEC$PINTS)
kable(mmm, format = "html")
```

<table>
 <thead>
  <tr>
   <th>   </th>
   <th> Rnorv </th>
   <th> Hpylo </th>
   <th> Mmusc </th>
   <th> Cel </th>
   <th> Eco </th>
   <th> Hsapi </th>
   <th> sce </th>
   <th> Dme </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td> Rnorv </td>
   <td> 0.0000 </td>
   <td> 0.2159 </td>
   <td> 0.6136 </td>
   <td> 0.4602 </td>
   <td> 0.2955 </td>
   <td> 0.3210 </td>
   <td> 0.3494 </td>
   <td> 0.5369 </td>
  </tr>
  <tr>
   <td> Hpylo </td>
   <td> 0.2159 </td>
   <td> 0.0000 </td>
   <td> 0.1652 </td>
   <td> 0.1667 </td>
   <td> 0.0712 </td>
   <td> 0.1946 </td>
   <td> 0.1527 </td>
   <td> 0.2078 </td>
  </tr>
  <tr>
   <td> Mmusc </td>
   <td> 0.6136 </td>
   <td> 0.1652 </td>
   <td> 0.0000 </td>
   <td> 0.3698 </td>
   <td> 0.2682 </td>
   <td> 0.4049 </td>
   <td> 0.1211 </td>
   <td> 0.1699 </td>
  </tr>
  <tr>
   <td> Cel </td>
   <td> 0.4602 </td>
   <td> 0.1667 </td>
   <td> 0.3698 </td>
   <td> 0.0000 </td>
   <td> 0.1321 </td>
   <td> 0.2016 </td>
   <td> 0.1759 </td>
   <td> 0.2006 </td>
  </tr>
  <tr>
   <td> Eco </td>
   <td> 0.2955 </td>
   <td> 0.0712 </td>
   <td> 0.2682 </td>
   <td> 0.1321 </td>
   <td> 0.0000 </td>
   <td> 0.0480 </td>
   <td> 0.1093 </td>
   <td> 0.0000 </td>
  </tr>
  <tr>
   <td> Hsapi </td>
   <td> 0.3210 </td>
   <td> 0.1946 </td>
   <td> 0.4049 </td>
   <td> 0.2016 </td>
   <td> 0.0480 </td>
   <td> 0.0000 </td>
   <td> 0.0000 </td>
   <td> 0.0000 </td>
  </tr>
  <tr>
   <td> sce </td>
   <td> 0.3494 </td>
   <td> 0.1527 </td>
   <td> 0.1211 </td>
   <td> 0.1759 </td>
   <td> 0.1093 </td>
   <td> 0.0000 </td>
   <td> 0.0000 </td>
   <td> 0.0000 </td>
  </tr>
  <tr>
   <td> Dme </td>
   <td> 0.5369 </td>
   <td> 0.2078 </td>
   <td> 0.1699 </td>
   <td> 0.2006 </td>
   <td> 0.0000 </td>
   <td> 0.0000 </td>
   <td> 0.0000 </td>
   <td> 0.0000 </td>
  </tr>
</tbody>
</table>



```r
mmm = as.table(BEC$NETAL)
kable(mmm, format = "html")
```

<table>
 <thead>
  <tr>
   <th>   </th>
   <th> Rnorv </th>
   <th> Hpylo </th>
   <th> Mmusc </th>
   <th> Cel </th>
   <th> Eco </th>
   <th> Hsapi </th>
   <th> sce </th>
   <th> Dme </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td> Rnorv </td>
   <td> 0.0000 </td>
   <td> 0.8665 </td>
   <td> 0.8352 </td>
   <td> 0.8068 </td>
   <td> 0.5881 </td>
   <td> 0.8324 </td>
   <td> 0.5966 </td>
   <td> 0.7017 </td>
  </tr>
  <tr>
   <td> Hpylo </td>
   <td> 0.8665 </td>
   <td> 0.0000 </td>
   <td> 0.4302 </td>
   <td> 0.5000 </td>
   <td> 0.5661 </td>
   <td> 0.5015 </td>
   <td> 0.3605 </td>
   <td> 0.4266 </td>
  </tr>
  <tr>
   <td> Mmusc </td>
   <td> 0.8352 </td>
   <td> 0.4302 </td>
   <td> 0.0000 </td>
   <td> 0.6335 </td>
   <td> 0.5671 </td>
   <td> 0.7148 </td>
   <td> 0.2214 </td>
   <td> 0.2747 </td>
  </tr>
  <tr>
   <td> Cel </td>
   <td> 0.8068 </td>
   <td> 0.5000 </td>
   <td> 0.6335 </td>
   <td> 0.0000 </td>
   <td> 0.5704 </td>
   <td> 0.4720 </td>
   <td> 0.4159 </td>
   <td> 0.4441 </td>
  </tr>
  <tr>
   <td> Eco </td>
   <td> 0.5881 </td>
   <td> 0.5661 </td>
   <td> 0.5671 </td>
   <td> 0.5704 </td>
   <td> 0.0000 </td>
   <td> 0.2044 </td>
   <td> 0.0000 </td>
   <td> 0.0000 </td>
  </tr>
  <tr>
   <td> Hsapi </td>
   <td> 0.8324 </td>
   <td> 0.5015 </td>
   <td> 0.7148 </td>
   <td> 0.4720 </td>
   <td> 0.2044 </td>
   <td> 0.0000 </td>
   <td> 0.0000 </td>
   <td> 0.0000 </td>
  </tr>
  <tr>
   <td> sce </td>
   <td> 0.5966 </td>
   <td> 0.3605 </td>
   <td> 0.2214 </td>
   <td> 0.4159 </td>
   <td> 0.0000 </td>
   <td> 0.0000 </td>
   <td> 0.0000 </td>
   <td> 0.0000 </td>
  </tr>
  <tr>
   <td> Dme </td>
   <td> 0.7017 </td>
   <td> 0.4266 </td>
   <td> 0.2747 </td>
   <td> 0.4441 </td>
   <td> 0.0000 </td>
   <td> 0.0000 </td>
   <td> 0.0000 </td>
   <td> 0.0000 </td>
  </tr>
</tbody>
</table>



EC with FC (EC - BC)

```r
EEE2 = "EC with FC"
EEE2$PINTS = EEE$pints - BEC$PINTS
```

```
## Warning: Coercing LHS to a list
```

```r
EEE2$NETAL = EEE$netal - BEC$NETAL
```



```r
mmm = as.table(EEE2$PINTS)
kable(mmm, format = "html")
```

<table>
 <thead>
  <tr>
   <th>   </th>
   <th> Rnorv </th>
   <th> Hpylo </th>
   <th> Mmusc </th>
   <th> Cel </th>
   <th> Eco </th>
   <th> Hsapi </th>
   <th> sce </th>
   <th> Dme </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td> Rnorv </td>
   <td> 1.0000 </td>
   <td> 0.0767 </td>
   <td> 0.1989 </td>
   <td> 0.2216 </td>
   <td> 0.2131 </td>
   <td> 0.4886 </td>
   <td> 0.0426 </td>
   <td> 0.0625 </td>
  </tr>
  <tr>
   <td> Hpylo </td>
   <td> 0.0767 </td>
   <td> 1.0000 </td>
   <td> 0.0389 </td>
   <td> 0.1043 </td>
   <td> 0.1278 </td>
   <td> 0.1109 </td>
   <td> 0.0176 </td>
   <td> 0.0257 </td>
  </tr>
  <tr>
   <td> Mmusc </td>
   <td> 0.1989 </td>
   <td> 0.0389 </td>
   <td> 1.0000 </td>
   <td> 0.1133 </td>
   <td> 0.0918 </td>
   <td> 0.2187 </td>
   <td> 0.1641 </td>
   <td> 0.2240 </td>
  </tr>
  <tr>
   <td> Cel </td>
   <td> 0.2216 </td>
   <td> 0.1043 </td>
   <td> 0.1133 </td>
   <td> 1.0000 </td>
   <td> 0.0932 </td>
   <td> 0.1308 </td>
   <td> 0.0511 </td>
   <td> 0.0446 </td>
  </tr>
  <tr>
   <td> Eco </td>
   <td> 0.2131 </td>
   <td> 0.1278 </td>
   <td> 0.0918 </td>
   <td> 0.0932 </td>
   <td> 1.0000 </td>
   <td> 0.1808 </td>
   <td> 0.0459 </td>
   <td> 0.1192 </td>
  </tr>
  <tr>
   <td> Hsapi </td>
   <td> 0.4886 </td>
   <td> 0.1109 </td>
   <td> 0.2187 </td>
   <td> 0.1308 </td>
   <td> 0.1808 </td>
   <td> 1.0000 </td>
   <td> 0.2301 </td>
   <td> 0.2810 </td>
  </tr>
  <tr>
   <td> sce </td>
   <td> 0.0426 </td>
   <td> 0.0176 </td>
   <td> 0.1641 </td>
   <td> 0.0511 </td>
   <td> 0.0459 </td>
   <td> 0.2301 </td>
   <td> 1.0000 </td>
   <td> 0.0792 </td>
  </tr>
  <tr>
   <td> Dme </td>
   <td> 0.0625 </td>
   <td> 0.0257 </td>
   <td> 0.2240 </td>
   <td> 0.0446 </td>
   <td> 0.1192 </td>
   <td> 0.2810 </td>
   <td> 0.0792 </td>
   <td> 1.0000 </td>
  </tr>
</tbody>
</table>



```r
mmm = as.table(EEE2$NETAL)
kable(mmm, format = "html")
```

<table>
 <thead>
  <tr>
   <th>   </th>
   <th> Rnorv </th>
   <th> Hpylo </th>
   <th> Mmusc </th>
   <th> Cel </th>
   <th> Eco </th>
   <th> Hsapi </th>
   <th> sce </th>
   <th> Dme </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td> Rnorv </td>
   <td> 1.0000 </td>
   <td> 0.0057 </td>
   <td> 0.0341 </td>
   <td> 0.0170 </td>
   <td> 0.0028 </td>
   <td> 0.0000 </td>
   <td> 0.0426 </td>
   <td> 0.0597 </td>
  </tr>
  <tr>
   <td> Hpylo </td>
   <td> 0.0057 </td>
   <td> 1.0000 </td>
   <td> 0.0264 </td>
   <td> 0.0066 </td>
   <td> 0.0154 </td>
   <td> 0.0007 </td>
   <td> 0.0330 </td>
   <td> 0.0411 </td>
  </tr>
  <tr>
   <td> Mmusc </td>
   <td> 0.0341 </td>
   <td> 0.0264 </td>
   <td> 1.0000 </td>
   <td> 0.0560 </td>
   <td> 0.0482 </td>
   <td> 0.0202 </td>
   <td> 0.3047 </td>
   <td> 0.3665 </td>
  </tr>
  <tr>
   <td> Cel </td>
   <td> 0.0170 </td>
   <td> 0.0066 </td>
   <td> 0.0560 </td>
   <td> 1.0000 </td>
   <td> 0.0130 </td>
   <td> 0.0035 </td>
   <td> 0.0895 </td>
   <td> 0.0862 </td>
  </tr>
  <tr>
   <td> Eco </td>
   <td> 0.0028 </td>
   <td> 0.0154 </td>
   <td> 0.0482 </td>
   <td> 0.0130 </td>
   <td> 1.0000 </td>
   <td> 0.3163 </td>
   <td> 0.3316 </td>
   <td> 0.2965 </td>
  </tr>
  <tr>
   <td> Hsapi </td>
   <td> 0.0000 </td>
   <td> 0.0007 </td>
   <td> 0.0202 </td>
   <td> 0.0035 </td>
   <td> 0.3163 </td>
   <td> 1.0000 </td>
   <td> 0.5348 </td>
   <td> 0.5538 </td>
  </tr>
  <tr>
   <td> sce </td>
   <td> 0.0426 </td>
   <td> 0.0330 </td>
   <td> 0.3047 </td>
   <td> 0.0895 </td>
   <td> 0.3316 </td>
   <td> 0.5348 </td>
   <td> 1.0000 </td>
   <td> 0.2522 </td>
  </tr>
  <tr>
   <td> Dme </td>
   <td> 0.0597 </td>
   <td> 0.0411 </td>
   <td> 0.3665 </td>
   <td> 0.0862 </td>
   <td> 0.2965 </td>
   <td> 0.5538 </td>
   <td> 0.2522 </td>
   <td> 1.0000 </td>
  </tr>
</tbody>
</table>


Diference

```r

print("Diference")
```

[1] "Diference"

```r
DDD = EEE2$PINTS - EEE2$NETAL
mmm = as.table(DDD)
kable(mmm, format = "html")
```

<table>
 <thead>
  <tr>
   <th>   </th>
   <th> Rnorv </th>
   <th> Hpylo </th>
   <th> Mmusc </th>
   <th> Cel </th>
   <th> Eco </th>
   <th> Hsapi </th>
   <th> sce </th>
   <th> Dme </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td> Rnorv </td>
   <td> 0.0000 </td>
   <td>  0.0710 </td>
   <td>  0.1648 </td>
   <td>  0.2045 </td>
   <td>  0.2102 </td>
   <td>  0.4886 </td>
   <td>  0.0000 </td>
   <td>  0.0028 </td>
  </tr>
  <tr>
   <td> Hpylo </td>
   <td> 0.0710 </td>
   <td>  0.0000 </td>
   <td>  0.0125 </td>
   <td>  0.0977 </td>
   <td>  0.1123 </td>
   <td>  0.1101 </td>
   <td> -0.0154 </td>
   <td> -0.0154 </td>
  </tr>
  <tr>
   <td> Mmusc </td>
   <td> 0.1648 </td>
   <td>  0.0125 </td>
   <td>  0.0000 </td>
   <td>  0.0573 </td>
   <td>  0.0436 </td>
   <td>  0.1986 </td>
   <td> -0.1406 </td>
   <td> -0.1426 </td>
  </tr>
  <tr>
   <td> Cel </td>
   <td> 0.2045 </td>
   <td>  0.0977 </td>
   <td>  0.0573 </td>
   <td>  0.0000 </td>
   <td>  0.0802 </td>
   <td>  0.1273 </td>
   <td> -0.0384 </td>
   <td> -0.0416 </td>
  </tr>
  <tr>
   <td> Eco </td>
   <td> 0.2102 </td>
   <td>  0.1123 </td>
   <td>  0.0436 </td>
   <td>  0.0802 </td>
   <td>  0.0000 </td>
   <td> -0.1356 </td>
   <td> -0.2857 </td>
   <td> -0.1773 </td>
  </tr>
  <tr>
   <td> Hsapi </td>
   <td> 0.4886 </td>
   <td>  0.1101 </td>
   <td>  0.1986 </td>
   <td>  0.1273 </td>
   <td> -0.1356 </td>
   <td>  0.0000 </td>
   <td> -0.3047 </td>
   <td> -0.2729 </td>
  </tr>
  <tr>
   <td> sce </td>
   <td> 0.0000 </td>
   <td> -0.0154 </td>
   <td> -0.1406 </td>
   <td> -0.0384 </td>
   <td> -0.2857 </td>
   <td> -0.3047 </td>
   <td>  0.0000 </td>
   <td> -0.1730 </td>
  </tr>
  <tr>
   <td> Dme </td>
   <td> 0.0028 </td>
   <td> -0.0154 </td>
   <td> -0.1426 </td>
   <td> -0.0416 </td>
   <td> -0.1773 </td>
   <td> -0.2729 </td>
   <td> -0.1730 </td>
   <td>  0.0000 </td>
  </tr>
</tbody>
</table>


Average

```r
sum(DDD)/120
```

```
## [1] 0.003976
```


