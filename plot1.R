## --------------------------------
## CourseraCourse: DataScience - 4.Exploratory Data Analysis Course Project
## --------------------------------
## Week 1 - Assignement 1 - Plot 1 of 4 -
## Student/Author: Benz Nydegger
## Date: 27-May-2018
## Source Data: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
## Input File(s): household_power_consumption.txt
## Script Name: plot1.R
## Output Data: plot1.png

# Set Local Woking Dir to 
#setwd("C:/.../Data/household_power_consumption.txt")

# Read training & test data
electricpowerconsumption <- read.table("Data/household_power_consumption.txt",sep=";", header=T)

# Household power consumption from 2007-02-01 and 2007-02-02
electricpowerconsumption <- electricpowerconsumption[as.character(electricpowerconsumption$Date) %in% c("1/2/2007", "2/2/2007"),]

# Plot 1
GlobalActivePower <- electricpowerconsumption$Global_active_power


# Plot the Graph
png("plot1.png", width=480, height=480, units="px")
hist(as.numeric(as.character(GlobalActivePower)), col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     mgp = c(3, 0.7, 0),
     cex.main=1.2, 
     cex.lab=1, 
     cex.axis=1)
dev.off()

