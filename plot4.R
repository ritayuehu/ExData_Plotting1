# Set working directory
setwd("C:/Users/user/Desktop/Coursera/Git/ExData_Plotting1")

datafile <- ("C:/Users/user/Desktop/Coursera/03.DataScienceFoundationsusingRSpecialization/4.ExploratoryDataAnalysis/CourseProject1/household_power_consumption.txt")

# read data
rawdata <- read.table(datafile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".",
                      na.strings="?", nrows=2075262) # nrows is set to overestimate a little
# str(rawdata)
# tail(rawdata)

# choose dates
data4 <- subset(rawdata, Date %in% c("1/2/2007", "2/2/2007"))
datetime4 <- strptime(paste(data3$Date, data3$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime4, data4$Global_active_power, type = "l", ylab = "Global Active Power", cex = 0.2)

plot(datetime4, data4$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(datetime4, data4$Sub_metering_1, type = "l", ylab = "Energy Submetering", xlab = "")
lines(datetime4, data4$Sub_metering_2, type = "l", col = "red")
lines(datetime4, data4$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       , lty = 1, lwd = 2.5, col = c("black", "red", "blue"), bty = "n")

plot(datetime4, data4$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()