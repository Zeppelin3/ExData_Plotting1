#set working directory
setwd("C:/Users/chapp/Documents/Coursera/Exploratory Data Analysis/ExData_Plotting1")

#Load data
data <- read.csv("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

#subset data for dates 2007-02-01 and 2007-02-02
subdata <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

#Convert the Date and Time variables to Date/Time classes
subdata$Date <- as.Date(subdata$Date, format = "%d/%m/%Y")

datetime <- paste(as.Date(subdata$Date), subdata$Time)
subdata$Datetime <- as.POSIXct(datetime)

#Make plot 2 and print to PNG
png("plot2.png", width=480, height=480)
with(subdata, plot(Global_active_power ~ Datetime, type = "l", ylab = "Global Active Power (kilowatts)",
                   xlab = ""))
dev.off()