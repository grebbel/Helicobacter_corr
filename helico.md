Helicobacter pylori analysis of real-time PCR result
========================================================




```r
setwd("~/Documents/workspace/R-project/Helicobacter")

helicoDR <- read.delim("~/Documents/workspace/R-project/Helicobacter/helicoDR.txt", dec=",")
View(helicoDR)
summary(helicoDR)
```

```
##       SIN           Biopt.Ct       Stool.Ct   
##  Min.   : 1.00   Min.   :18.2   Min.   :18.9  
##  1st Qu.: 8.25   1st Qu.:25.6   1st Qu.:26.6  
##  Median :15.50   Median :33.8   Median :34.8  
##  Mean   :15.50   Mean   :32.4   Mean   :34.2  
##  3rd Qu.:22.75   3rd Qu.:36.5   3rd Qu.:38.7  
##  Max.   :30.00   Max.   :44.3   Max.   :48.3
```

```r
head(helicoDR)
```

```
##   SIN Biopt.Ct Stool.Ct
## 1   1     35.8     39.8
## 2   2     22.9     33.5
## 3   3     36.5     48.3
## 4   4     44.3     48.3
## 5   5     21.1     18.9
## 6   6     33.5     35.4
```
Select Ct values of biopsies and stool
Make boxplot

```r
biopt <- helicoDR$Biopt.Ct
stool <- helicoDR$Stool.Ct

bxp <- boxplot(biopt, stool, xlab = "biopt           stool", ylab = "Ct-value")
```

![plot of chunk boxplot](figure/boxplot.png) 

```r
bxp
```

```
## $stats
##      [,1] [,2]
## [1,] 18.2 18.9
## [2,] 24.7 26.5
## [3,] 33.8 34.8
## [4,] 36.5 39.0
## [5,] 44.3 48.3
## 
## $n
## [1] 30 30
## 
## $conf
##      [,1]  [,2]
## [1,] 30.4 31.19
## [2,] 37.2 38.41
## 
## $out
## numeric(0)
## 
## $group
## numeric(0)
## 
## $names
## [1] "" ""
```
derive differences of Mean Ct-values between biopt and stool
Draw Q-Q plot

```r
mean(biopt)
```

```
## [1] 32.37
```

```r
mean(stool)
```

```
## [1] 34.19
```

```r
# mean Bio - mean ICL
mean(biopt)-mean(stool)
```

```
## [1] -1.813
```

```r
helicoDR$diff <- biopt-stool
helicoDR$diff
```

```
##  [1]  -4.0 -10.6 -11.8  -4.0   2.2  -1.9  -1.8   4.3   2.1  -6.7   1.4
## [12]   7.7  -3.4   3.5  -2.8   3.2  -3.5  -8.8   0.2  -6.8   2.4  -2.6
## [23]  13.6  -3.4  -2.0  -5.3 -12.3  -1.5   1.0  -2.8
```

```r
boxplot(helicoDR$diff)
```

![plot of chunk means](figure/means1.png) 

```r
qqnorm(helicoDR$diff)
qqline(helicoDR$diff)
```

![plot of chunk means](figure/means2.png) 
Shaphiro test of normality. Perform paired T-test between Biopt and Stool

```r
shapiro.test(helicoDR$diff)
```

```
## 
## 	Shapiro-Wilk normality test
## 
## data:  helicoDR$diff
## W = 0.9674, p-value = 0.4716
```

```r
t.test(biopt, stool, mu=0, paired=T, alternative="greater")
```

```
## 
## 	Paired t-test
## 
## data:  biopt and stool
## t = -1.776, df = 29, p-value = 0.9569
## alternative hypothesis: true difference in means is greater than 0
## 95 percent confidence interval:
##  -3.548    Inf
## sample estimates:
## mean of the differences 
##                  -1.813
```
