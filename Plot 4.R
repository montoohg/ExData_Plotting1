## hpc = Household Power Consumption

library(data.table)
library(dplyr)

## Removes all pre-existing variables. 
rm(list = ls())   

## Set working directory to preferred folder on Desktop

setwd('C:/Users/mhgandhi/Desktop/Data Science Specialization/Course 4 - Exploratory Data Analysis/
      Week 1/Course Project 1')
getwd()

## Reading raw .txt file into hpc variable

hpc <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)

head(hpc)
str(hpc)

##  Changing Date and Time formats from Factors to Date and Character. 

hpc$Date <- as.Date(hpc$Date,format = "%d/%m/%Y")
hpc$Time <- format(hpc$Time, format = "%H:%M:%S")

## Changing remaining columns fom Character to Numeric.

hpc$Global_active_power <- as.numeric(hpc$Global_active_power)
hpc$Global_reactive_power <- as.numeric(hpc$Global_reactive_power)
hpc$Voltage <- as.numeric(hpc$Voltage)
hpc$Global_intensity <- as.numeric(hpc$Global_intensity)
hpc$Sub_metering_1 <- as.numeric(hpc$Sub_metering_1)
hpc$Sub_metering_2 <- as.numeric(hpc$Sub_metering_2)
hpc$Sub_metering_3 <- as.numeric(hpc$Sub_metering_3)

## Filter for specified dates.

hpc <- hpc[hpc$Date >= '2007-02-01' & hpc$Date <= '2007-02-02',]
head(hpc)
tail(hpc)
str(hpc)

## -------------------------- PLOT 4---------------------------------------##

## First - Create a date_time column to combine date and time columns.

## Second - Check default number of plots using par(mfrow) function.

## Third - Create file Plot4.png of 480 X 480.

## Fourth - Set number of plots to a 2 X 2 using par(mfrow) function

## Fifth - Plot using with function to avoid naming dataset repeatedly.

hpc$date_time <- as.POSIXct(paste(hpc$Date, hpc$Time), format="%Y-%m-%d %H:%M:%S")

par("mfrow")
png(filename = "Plot4.png", width = 480,height = 480)
par(mfrow = c(2,2),oma = c(0,0,2,0))
with(hpc, 
     {
plot(date_time,Global_active_power,type = "l",xlab = " ",ylab = "Global Active Power (kilowatts)")
plot(date_time,Voltage,type = "l",xlab = " datetime ",ylab = "Voltage")
plot(date_time,Sub_metering_1, type = "l", 
     xlab = " ",ylab = "Energy sub metering")
lines(date_time,Sub_metering_2, type = "l", col = "red1")
lines(date_time,Sub_metering_3, type = "l", col = "mediumblue")
legend("topright",names(hpc)[7:9], lty = 1, 
       col = c("black","red1","mediumblue"), bty ='o')
plot(date_time,Global_reactive_power,type = "l",xlab = " datetime ",ylab = "Global_reactive_power")
     })
dev.off()

