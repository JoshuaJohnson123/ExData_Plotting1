### Exploratory Data Analysis
### Week 1 - Course Project 1

library(tidyverse)

## Read in Data

df <- read.table("household_power_consumption.txt", sep=";", header = TRUE)

## Filter and clean Data

df1 <- df %>% dplyr::mutate(Date_Time = paste(Date, Time, sep = " "),
                            Date = as.Date(Date, "%d/%m/%Y"),
                            Date_Time = as.POSIXct(Date_Time, format = "%d/%m/%Y %H:%M:%S"),
                            Global_active_power = as.numeric(as.character(Global_active_power)),
                            Global_reactive_power = as.numeric(as.character(Global_reactive_power)),
                            Voltage = as.numeric(as.character(Voltage)),
                            Global_intensity  = as.numeric(as.character(Global_intensity)),
                            Sub_metering_1 = as.numeric(as.character(Sub_metering_1)),
                            Sub_metering_2 = as.numeric(as.character(Sub_metering_2)),
                            Sub_metering_3 = as.numeric(as.character(Sub_metering_3))) %>% 
  dplyr::filter(Date >= '2007-02-01' & Date <= '2007-02-02')

## Plot 4

par(mfrow = c(2, 2))
with(df1, {
  plot(Date_Time, Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
  plot(x = Date_Time, y = Voltage, xlab = "", type = "l")
  plot(x = df1$Date_Time, y = df1$Sub_metering_1, xlab = "", ylab = "Energy Sub metering", type = "l")
  lines(x = df1$Date_Time, y = df1$Sub_metering_2, type = "l", col = "red")
  lines(x = df1$Date_Time, y = df1$Sub_metering_3, type = "l", col = "blue")
  legend("topright", pch = 1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(x = Date_Time, y = Global_reactive_power, xlab = "", type = "l")
})
