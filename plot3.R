## --------------------------------
## CourseraCourse: DataScience - 4.Exploratory Data Analysis Course Project
## --------------------------------
## Week 1 - Assignement 1 - Plot 3 of 4 -
## Student/Author: Benz Nydegger
## Date: 27-May-2018
## Source Data: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
## Input File(s):household_power_consumption.txt
## Script Name: plot3.R
## Output Data: plot3.png

# Set Local Woking Dir
setwd("C:/Users/GuyManuelBendichtNyd/Desktop/DataScience/JohnHoppkins/4.Exploratory Data Analysis/Week1/Assignement")

# Read training & test data
electricpowerconsumption <- read.table("Data/household_power_consumption.txt",sep=";", header=T)

# Household power consumption from 2007-02-01 and 2007-02-02
electricpowerconsumption <- electricpowerconsumption[as.character(electricpowerconsumption$Date) %in% c("1/2/2007", "2/2/2007"),]

electricpowerconsumption$Date <- as.Date(electricpowerconsumption$Date, format = "%d/%m/%Y")
electricpowerconsumption$Time <- as.character(electricpowerconsumption$Time)
electricpowerconsumption$datetime = paste(electricpowerconsumption$Date, electricpowerconsumption$Time)

# Convert to Date/Time class
electricpowerconsumption$datetime <- strptime(electricpowerconsumption$datetime,"%Y-%m-%d %H:%M:%S")


# Plot the Graph
png("plot3.png", width=480, height=480, units="px")

plot(electricpowerconsumption$datetime, as.numeric(as.character(electricpowerconsumption$Sub_metering_1)), type="n", 
     xlab="", 
     ylab="Energy sub metering",
     mgp = c(3, 0.7, 0),
     cex.lab=1, 
     cex.axis=1)
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("black", "red", "blue"),lty=1:1:1, cex = 1)


lines(electricpowerconsumption$datetime, as.numeric(as.character(electricpowerconsumption$Sub_metering_1)), type="l")
lines(electricpowerconsumption$datetime, as.numeric(as.character(electricpowerconsumption$Sub_metering_2)), col = "red", type="l")
lines(electricpowerconsumption$datetime, as.numeric(as.character(electricpowerconsumption$Sub_metering_3)), col = "blue", type="l")

dev.off()
