#NO 1
library(BSDA)
x <- c(78,75,67,77,70,72,78,74,77)
y <- c(100,95,70,90,90,90,89,90,100)
disp <- y-y
sdev = sd(disp, na.rm = FALSE)
sdev
t.test(x,y, var.equal = FALSE)
var.test(x,y)
t.test(x,y, var.equal = TRUE)
#NO 2
library(BSDA)

zsum.test(mean.x = 23500, sigma.x = 3900, n.x = 100,
          alternative = "greater", mu = 20000,
          conf.level = 0.95)
		  
#NO 3
library(BSDA)
library(mosaic)
tsum.test(mean.x=3.64, s.x = 1.67, n.x = 19, 
          mean.y=2.79, s.y = 1.32, n.y = 27, 
          alternative = "two.sided", mu = 0, var.equal = TRUE,
          conf.level = 0.95)
plotDist(dist ='t', df = 2, col="blue")
qt(p = 0.05, df = 2, lower.tail = FALSE)

#NO 4
File  <- read.table(url("https://rstatisticsandresearch.weebly.com/uploads/1/0/2/6/1026585/onewayanova.txt"))
dim(File)
head(File)
attach(File)

File$V1 <- as.factor(File$V1)
File$V1 = factor(File$V1,labels = c("Kucing Oren","Kucing Hitam","Kucing Putih","Kucing Oren"))

class(File$V1)

group1 <- subset(File, V1=="Kucing Oren")
group2 <- subset(File, V1=="Kucing Hitam")
group3 <- subset(File, V1=="Kucing Putih")

#4b
bartlett.test(Length~V1, data=dataoneway)

#4c
qqnorm(group1$Length)
qqline(group1$Length)

#4d
# Nilai P-Value adalah 0.8054

#4e
model1 <- lm(Length~Group, data=File)

anova(model1)

TukeyHSD(aov(model1))

#4f
library(ggplot2)
ggplot(dataoneway, aes(x = Group, y = Length)) + geom_boxplot(fill = "grey80", colour = "black") + 
  scale_x_discrete() + xlab("Treatment Group") +  ylab("Length (cm)")
  
#NO 5
library(readr)
library(ggplot2)
library(multcompView)
library(dplyr)

GTL <- read_csv("GTL.csv")
head(GTL)

qplot(x = Temp, y = Light, geom = "point", data = GTL) +
  facet_grid(.~Glass, labeller = label_both)

#5a
GTL$Glass <- as.factor(GTL$Glass)
GTL$Temp_Factor <- as.factor(GTL$Temp)
str(GTL)

#5b
anova <- aov(Light ~ Glass*Temp_Factor, data = GTL)
summary(anova)

#5cd
ata_summary <- group_by(GTL, Glass, Temp) %>%
  summarise(mean=mean(Light), sd=sd(Light)) %>%
  arrange(desc(mean))
print(data_summary)

#Test Tukey
print("Uji Tukey:")
tukey <- TukeyHSD(anova)
print(tukey)

# compact letter display
print("Compact Letter Display:")
tukey.cld <- multcompLetters4(anova, tukey)
print(tukey.cld)