#Q1
#Change file name to q3.1
#Loal file
#Based on the code book, ACR and AGS are two variables that will be used
q3.1 <- read.csv("./GCD/q3.1.csv")
#Assign that logical vector to the variable agricultureLogical
agricultureLogical <- q3.1$ACR == 3 & q3.1$AGS == 6
row3.1 <- q3.1[which(agricultureLogical), c(11,12)]
head(row3.1, 3)

