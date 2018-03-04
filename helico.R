setwd("~/Documents/workspace/R-project/Helicobacter")

# read file
helicoDR <- read.delim("~/Documents/workspace/R-project/Helicobacter/helicoDR.txt", dec=",")
View(helicoDR)
summary(helicoDR)
head(helicoDR)

# Select Ct values of biopsies and stool
# Make boxplot
biopt <- helicoDR$Biopt.Ct
stool <- helicoDR$Stool.Ct

bxp <- boxplot(biopt, stool, xlab = "biopt           stool", ylab = "Ct-value")
bxp

# derive differences of Mean Ct-values between biopt and stool
# Draw Q-Q plot
mean(biopt)
mean(stool)
# mean Bio - mean ICL
mean(biopt)-mean(stool)

helicoDR$diff <- biopt-stool
helicoDR$diff

boxplot(helicoDR$diff)
qqnorm(helicoDR$diff)
qqline(helicoDR$diff)

# Shaphiro test of normality. Perform paired T-test between Biopt and Stool
shapiro.test(helicoDR$diff)

t.test(biopt, stool, mu=0, paired=T, alternative="greater")

