#Q1
#Download file and change file name to q4.1.csv
#load file
q4.1 <- read.csv("./GCD/q4.1.csv")
#Split all the names of the data frame on the character "wgtp"
splitnames <- strsplit(names(q4.1), "wgtp")
splitnames[[123]]

#Q2
