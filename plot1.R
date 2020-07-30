# Set working directory
setwd("C:/Users/user/Desktop/Coursera/Git/ExData_Plotting1")

datafile <- ("C:/Users/user/Desktop/Coursera/03.DataScienceFoundationsusingRSpecialization/4.ExploratoryDataAnalysis/CourseProject1/household_power_consumption.txt")

# read data
rawdata <- read.table(datafile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".",
                      na.strings="?", nrows=2075262) # nrows is set to overestimate a little
# str(rawdata)
# tail(rawdata)

# choose dates
data1 <- subset(rawdata, Date %in% c("1/2/2007", "2/2/2007"))
data1$Date <- as.Date(data1$Date, format = "%d/%m/%Y")

png("plot1.png", width=480, height=480)

hist(data1$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

dev.off()