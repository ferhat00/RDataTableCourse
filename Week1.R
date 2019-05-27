download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", destfile = "C:\\Users\\Ferhat\\Documents\\GitHub\\RDataTableCourse\\data.csv")
data = read.csv("C:\\Users\\Ferhat\\Documents\\GitHub\\RDataTableCourse\\data.csv")
library(data.table)
data = as.data.table(data)
summary(data)
data[, .(count = .N, var = sum(VAL)), by = VAL]


download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx", destfile = "C:\\Users\\Ferhat\\Documents\\GitHub\\RDataTableCourse\\excel_data2.xlsx")
require(xlsx)
excel_data = xlsx::read.xlsx("C:\\Users\\Ferhat\\Documents\\GitHub\\RDataTableCourse\\excel_data2.xlsx")


url <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
library(XML)
doc <- xml_data <- XML::xmlTreeParse(url, useInternal = TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)
names(rootNode)
rootNode[[1]][[1]]
xmlSApply(rootNode, xmlValue)
xpathSApply(rootNode,"//zipcode", xmlValue)
zips = xpathSApply(rootNode,"//zipcode", xmlValue)
table(zips)


download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv", destfile = "C:\\Users\\Ferhat\\Documents\\GitHub\\RDataTableCourse\\housing_data.csv")
housing_data = fread(file = "C:\\Users\\Ferhat\\Documents\\GitHub\\RDataTableCourse\\housing_data.csv")
DT <- housing_data
system.time(mean(DT[DT$SEX==1,]$pwgtp15))#; 
system.time(mean(DT[DT$SEX==2,]$pwgtp15))

system.time(DT[,mean(pwgtp15),by=SEX])

system.time(tapply(DT$pwgtp15,DT$SEX,mean))

system.time(rowMeans(DT)[DT$SEX==1])
system.time(rowMeans(DT)[DT$SEX==2])

system.time(mean(DT$pwgtp15,by=DT$SEX))

system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
