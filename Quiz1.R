#Q1

#change file name to q1
#load q1

q1 <- read.csv("./GCD/q1.csv")

#summary VAL, 24 meaning value >= 1,000,000

table(q1$VAL)

#Q2

#FES = Family type and employment status

#Family type should be one variable (personal thought)
#employment status should be another variable (personal thought)

#Q3
#change file name to q3
#set row and col index
#load q3
library(xlsx)
colIndex <- 7:15
rowIndex <- 18:23
dat <- read.xlsx("./GCD/q3.xlsx", sheetIndex = 1, colIndex = colIndex, rowIndex = rowIndex)
sum(dat$Zip*dat$Ext,na.rm=T)

#Q4
#method 1
library(XML)
fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- xmlInternalTreeParse(fileUrl, useInternal = TRUE)
rootNode <- xmlRoot(doc)
table(xpathSApply(rootNode, "//zipcode", xmlValue))

#method 2, silly method
#open the xml page in Chrome, cmd+f, search 21231

#Q5

#change file name to q5.csv
#load file by fread() function
library(data.table)
DT <- fread("./GCD/q5.csv")
names(DT)

#calculate the average value of pwgtp15 by sex

DT[, mean(pwgtp15), by = SEX]


