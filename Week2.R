setwd("C:/Users/Ferhat/Documents/GitHub/RDataTableCourse")
acs = read.csv("getdata_data_ss06pid.csv")
library(sqldf)
sqldf("select pwgtp1 from acs where AGEP < 50")
sqldf("select * from acs where AGEP < 50")

length(unique(acs$AGEP))
sqldf("select distinct AGEP from acs")

con = url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode = readLines(con)
close(con)
htmlCode
nchar(htmlCode[10])
nchar(htmlCode[20])
nchar(htmlCode[30])
nchar(htmlCode[100])

for_file = read.fwf("getdata_wksst8110.for", widths = c(10,10,4,4,4,4,4,3,3,3,3,3,3,3,3,3,3,3,3,3), header = FALSE, skip = 4)

for_file = read.fwf("getdata_wksst8110.for", widths = c(10,10,4,4,4,4,4,3,3,3,3,3,3,3,3,3,3,3,3,3), header = FALSE, skip = 4)