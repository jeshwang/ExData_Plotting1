## Coursera: Exploratory Analysis - Week 1, Assignment 1, PLOT 3
## For Week Ending: Jan. 7, 2018
## User: jeshwang

#########################################################################
# Our overall goal here is simply to examine how household energy usage varies 
# over a 2-day period in February, 2007. Your task is to reconstruct the given plots,
# all of which were constructed using the base plotting system.
#########################################################################

#########################################################################
# STEP 0: Set up environment
#########################################################################
## Clear Memory
rm(list=ls())
gc(reset=TRUE)

## Set working directory
setwd("C:/Users/jhwang/Documents/R/Class4/Week 1")

#########################################################################
# STEP 1: Read data
#########################################################################
# Load data associated with dates 2/1/2007 and 2/2/2007
data <- read.table("household_power_consumption.txt", 
                   skip = grep("31/1/2007;23:59:00;0.326;0.126;242.800;1.400;0.000;0.000;0.000", 
                               readLines("household_power_consumption.txt")),
                   nrows = 2880, 
                   sep = ";",
                   na.strings = "?"
)

#########################################################################
# STEP 2: Clean data
#########################################################################
# Name columns
names(data) <- c("Date","Time","Global_active_power","Global_reactive_power", "Voltage",
                 "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

# Change date column into Date format
data$Date <- as.Date(data$Date,"%d/%m/%Y")

# Change time column format
data$Time <- as.POSIXct(strptime(paste(data$Date, ' ', data$Time), '%Y-%m-%d %H:%M:%S'))

#########################################################################
# STEP 3: Create Plot 3
#########################################################################
# Open device
png("plot3.png", width=480, height=480, units='px')


# Design plot
plot(data$Time, data$Sub_metering_1,
     type = "l", 
     xlab = "", ylab = "Energy sub metering")
lines(data$Time, data$Sub_metering_2,
      type = "l", col = "red")
lines(data$Time, data$Sub_metering_3,
      type = "l", col = "blue")

# Close device
dev.off()
