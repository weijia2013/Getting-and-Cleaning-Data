#Q1

library(httr)

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")
# 2. Register an application at https://github.com/settings/applications;
#    Use any URL you would like for the homepage URL (http://github.com is fine)
#    and http://localhost:1410 as the callback url
#
#    Insert your client ID and secret below - if secret is omitted, it will
#    look it up in the GITHUB_CONSUMER_SECRET environmental variable.
myapp <- oauth_app("github", "b0a22c0ed35db87c2376", "be50559115e267fcfa778a5ca42fd649aafd3821")

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
content(req)
output <- content(req)
list(output[[5]]$name, output[[5]]$created_at)

#Q2

#chang file name to q22
acs <- read.csv(./GCD/q22.csv)
sqldf("select pwgtp1 from acs where AGEP < 50")


#Q3
#load file
acs <- read.csv(./GCD/q22.csv)

x <- unique(acs$AGEP)
y <- sqldf("select distinct AGEP from acs")
length(x)

#Q4

#use readLines function to read webpage
q2.4 <- readLines("http://biostat.jhsph.edu/~jleek/contact.html")
#subset 10th, 20th, 30th and 100th line
q2.4.4 <- q2.4[c(10,20,30,100)]
#use nchar() function to calculate number of characters of each line
nchar(q2.4.4)

#Q5

#change file name to 25
#there are 9 variables and here only subset first four, try different width to get each col and variable
#use read.fwf function to get col 4

q25 <- "./GCD/q25.for"
test <- read.fwf(file = q25, width = c(10, 9, 8, 5), skip = 4, header = FALSE)
head(t1)
sum(t1$V4)

