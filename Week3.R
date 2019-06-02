idaho_dat = read.csv("C:/Users/Ferhat/Documents/GitHub/RDataTableCourse/getdata_data_ss06hid.csv")
library(data.table)
idaho_dat = as.data.table(idaho_dat)
subset1 = idaho_dat[which(idaho_dat$ACR == 3 & idaho_dat$AGS == 6),]
which(idaho_dat$ACR == 3 & idaho_dat$AGS == 6)


library(jpeg)
pic = jpeg::readJPEG("C:/Users/Ferhat/Documents/GitHub/RDataTableCourse/getdata_jeff.jpg", native = TRUE)
quantile(pic, probs = c(0.3, 0.8))


gdp_dat = read.csv("C:/Users/Ferhat/Documents/GitHub/RDataTableCourse/getdata_data_GDP.csv")
edu_dat = read.csv("C:/Users/Ferhat/Documents/GitHub/RDataTableCourse/getdata_data_EDSTATS_Country.csv")

setnames(gdp_dat, old = "X", new = "CountryCode")

merged = merge(gdp_dat, edu_dat)
merged$Gross.domestic.product.2012 =  as.numeric(levels(merged$Gross.domestic.product.2012)[merged$Gross.domestic.product.2012])
merged = as.data.table(merged)
merged = na.omit(merged, "Gross.domestic.product.2012")
merged[,lapply(.SD,mean),by=Income.Group, .SDcols = c("Gross.domestic.product.2012")]

library(dplyr)

merged$quantile <- ntile(merged$Gross.domestic.product.2012, 5) 
new_table = NULL
new_table = as.data.table(new_table)
new_table$CountryCode = merged$CountryCode
new_table$quantile = merged$quantile
new_table$Income.Group = merged$Income.Group
new_table$Gross.domestic.product.2012 = merged$Gross.domestic.product.2012
new_table[ Income.Group == "Lower middle income" & Gross.domestic.product.2012 <= 38,]
