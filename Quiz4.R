#Q1
#Download file and change file name to q4.1.csv
#load file
q4.1 <- read.csv("./GCD/q4.1.csv")
#Split all the names of the data frame on the character "wgtp"
splitnames <- strsplit(names(q4.1), "wgtp")
splitnames[[123]]

#Q2
#Use the same file of Quiz3 question 3. q3.3GDP.csv
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
#Use gsub funciton to remove many commas
gdp$UD <- gsub(",", "", gdp$UD)
#Check class of UD
class(gdp$UD)
#Change factor to int
gdp$UD <- as.numeric(as.character(gdp$UD))
#Calculate the mean
mean(gdp$UD)

#Q3
length(grep("^United", gdp$Economy))

#Q4
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
#load Edu file
edu <- read.csv("./GCD/q3.3Edu.csv")
#Merge gdp and edu by merge function. all = FALSE indicate only find the match countrycode
m3 <- merge(gdp, edu, by.x = "CC", by.y = "CountryCode", all = FALSE)
#Use grep function find the term "end: June"
length(grep("end: June", m3$Special.Notes))

#Q5
#Install package quantmod
#load package quantmod
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)
length(grep("^2012", index(amzn)))
#Add new col day to amzn
amzn$day <- as.Date(index(amzn))
amzn$day <- weekdays(as.Date(index(amzn)))
#subset amzn only with 2012 data
amzn2012 <- amzn[grep("^2012", index(amzn))]
#Calculate number of Monday
length(grep("Monday", amzn2012$day))
