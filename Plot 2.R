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

## -------------------------- PLOT 2---------------------------------------##

## First - Create a date_time column to combine date and time columns.

hpc$date_time <- as.POSIXct(paste(hpc$Date, hpc$Time), format="%Y-%m-%d %H:%M:%S")

## Second - Create file Plot2.png of 480 X 480 and then create plot on that file.

png(filename = "Plot2.png", width = 480,height = 480)
plot(hpc$date_time,hpc$Global_active_power,type = "l",xlab = " ",ylab = "Global Active Power (kilowatts)")
dev.off()

