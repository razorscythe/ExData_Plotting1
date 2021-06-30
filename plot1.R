library(data.table)
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
path <- getwd()
download.file(fileURL, file.path(path, "data.zip"))
unzip(zipfile = "data.zip")
data0 <- fread(file.path(path, "household_power_consumption.txt"), na.strings = "?")
names(data0)

##Changig the class of dates
library(lubridate)
dataf <- data0[ , Date := dmy(Date)]
##subsetting between required dates
datafinal <- dataf[(Date>=dmy(01022007))& (Date<=dmy(02022007))]
head(datafinal)

##Plotting
png(filename = "plot1.png", width = 480, height = 480)
with(datafinal, hist(Global_active_power, col='red', xlab = 'Global Active Power (kilowatts)', main = "Global Active Power"))
dev.off()
