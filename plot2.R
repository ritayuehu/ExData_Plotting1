# Set working directory
setwd("C:/Users/user/Desktop/Coursera/Git/ExData_Plotting1")

datafile <- ("C:/Users/user/Desktop/Coursera/03.DataScienceFoundationsusingRSpecialization/4.ExploratoryDataAnalysis/CourseProject1/household_power_consumption.txt")

# read data
rawdata <- read.table(datafile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".",
                      na.strings="?", nrows=2075262) # nrows is set to overestimate a little
# str(rawdata)
# tail(rawdata)

# choose dates
data2 <- subset(rawdata, Date %in% c("1/2/2007", "2/2/2007"))
datetime2 <- strptime(paste(data2$Date, data2$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

png("plot2.png", width=480, height=480)

plot(datetime2, data2$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()