#Q1
#Change file name to q3.1
#Loal file
#Based on the code book, ACR and AGS are two variables that will be used
q3.1 <- read.csv("./GCD/q3.1.csv")
#Assign that logical vector to the variable agricultureLogical
agricultureLogical <- q3.1$ACR == 3 & q3.1$AGS == 6
row3.1 <- q3.1[which(agricultureLogical), c(11,12)]
head(row3.1, 3)

#Q2
#Download the pic and change the file name to q3.2
#install jpeg package
#load jpeg package
library(jpeg)
#read file
q3.2 <- readJPEG("./GCD/q3.2.jpg", native = TRUE)
#calculate 30% and 80% quantile
quantile(q3.2, probs = c(0.3, 0.8))

#Q3
#change GDP file name to q3.3GDP, change EDU file name to q3.3Edu
#load two files
gdp <- read.csv("./GCD/q3.3GDP.csv")
#cleaning gdp data
#remove row 1, 2 and 4
gdp <- gdp[c(-1,-2,-4),]
#rename variable name
names(gdp)[names(gdp) == "X"] <- "CC" #CC means CountryCode
names(gdp)[names(gdp) == "Gross.domestic.product.2012"] <- "Ranking"
names(gdp)[names(gdp) == "X.2"] <- "Economy"
names(gdp)[names(gdp) == "X.3"] <- "UD"
#remove row 1
gdp <- gdp[-1,]
#subset gdp, new gdp include 190 countries and 4 variables
gdp <- gdp[1:190, c(1,2,4,5)]
