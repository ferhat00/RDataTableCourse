idaho_dat = read.csv("C:/Users/Ferhat/Documents/GitHub/RDataTableCourse/getdata_data_ss06hid.csv")
library(data.table)
idaho_dat = as.data.table(idaho_dat)
vector = names(idaho_dat)
vector_split = strsplit(vector, "wgtp")


gdp_dat = read.csv("C:/Users/Ferhat/Documents/GitHub/RDataTableCourse/getdata_data_GDP.csv")
gdp_dat$X.3 = gsub(",","", gdp_dat$X.3)
gdp_dat$X.3 = as.character(gdp_dat$X.3)
gdp_dat$X.3 = as.numeric(gdp_dat$X.3)
gdp_dat = as.data.table(gdp_dat)
gdp_dat = na.omit(gdp_dat, "X.3")
gdp_dat[gdp_dat==""] <- NA
gdp_dat = na.omit(gdp_dat, "Gross.domestic.product.2012")
gdp_dat[,lapply(.SD, mean), .SDcols = c("X.3")]


length(grep("^United",gdp_dat$X.2))

edu_dat = read.csv("C:/Users/Ferhat/Documents/GitHub/RDataTableCourse/getdata_data_EDSTATS_Country.csv")
setnames(gdp_dat, old = "X", new = "CountryCode")
merged = merge(gdp_dat, edu_dat)
length(grep("Fiscal year end: June", merged$Special.Notes))


library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)
library(lubridate)
length(which(year(sampleTimes) == "2012"))
length(which(wday(sampleTimes) == 2 & year(sampleTimes) == "2012"))
