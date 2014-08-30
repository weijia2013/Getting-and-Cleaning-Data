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
