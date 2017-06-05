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

## -------------------------- PLOT 3---------------------------------------##

## First - Create a date_time column to combine date and time columns.

## Second - Create file Plot3.png of 480 X 480.

## Third - Create a plot of Date_Time ~ Sub-Metering 1 and add through lines funtion. 

## Fourth - Add legend

hpc$date_time <- as.POSIXct(paste(hpc$Date, hpc$Time), format="%Y-%m-%d %H:%M:%S")

png(filename = "Plot3.png", width = 480,height = 480)
plot(hpc$date_time,hpc$Sub_metering_1, type = "l", 
     xlab = " ",ylab = "Energy sub metering")
lines(hpc$date_time,hpc$Sub_metering_2, type = "l", col = "red1")
lines(hpc$date_time,hpc$Sub_metering_3, type = "l", col = "mediumblue")
legend("topright",names(hpc)[7:9], lty = 1, 
       col = c("black","red1","mediumblue"), bty ='o')
dev.off()
