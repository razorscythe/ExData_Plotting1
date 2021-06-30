powerDT <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?")

# Making a POSIXct date capable of being filtered and graphed by time of day
powerDT[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Filter Dates for 2007-02-01 and 2007-02-02
powerDT <- powerDT[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

#plotting
png(filename = "plot4.png", height = 480, width = 480)
par(mfrow=c(2,2))
with(powerDT, plot(dateTime, Global_active_power, xlab="", ylab="Global Active Power", type="l"))
with(powerDT, plot(dateTime, Voltage, xlab="Voltage", ylab= "datetime", type="l"))
with(powerDT, plot(dateTime, Sub_metering_1, xlab="", ylab= "Energy sub metering", type="l"))
with(powerDT, lines(dateTime, Sub_metering_2, col="red"))
with(powerDT, lines(dateTime, Sub_metering_3, col="blue"))
legend("topright", col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1,1), lwd = c(1,1,1), bty = "n", cex = 0.5)
with(powerDT, plot(dateTime, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))
dev.off()
