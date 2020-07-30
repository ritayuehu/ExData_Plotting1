# Set working directory
setwd("C:/Users/user/Desktop/Coursera/Git/ExData_Plotting1")

datafile <- ("C:/Users/user/Desktop/Coursera/03.DataScienceFoundationsusingRSpecialization/4.ExploratoryDataAnalysis/CourseProject1/household_power_consumption.txt")

# read data
rawdata <- read.table(datafile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".",
                      na.strings="?", nrows=2075262) # nrows is set to overestimate a little
# str(rawdata)
# tail(rawdata)

# choose dates
data3 <- subset(rawdata, Date %in% c("1/2/2007", "2/2/2007"))
datetime3 <- strptime(paste(data3$Date, data3$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

png("plot3.png", width=480, height=480)

plot(datetime3, data3$Sub_metering_1, type = "l", ylab = "Energy Submetering", xlab = "")
lines(datetime3, data3$Sub_metering_2, type = "l", col = "red")
lines(datetime3, data3$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
        , lty = 1, lwd = 2.5, col = c("black", "red", "blue"))

dev.off()