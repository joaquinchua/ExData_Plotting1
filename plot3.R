# Initialise
library(data.table)
library(magrittr)
library(dplyr)
library(lubridate)

# Read data, filter period
data <- fread("household_power_consumption.txt", na.strings="?")
data %<>% mutate_at("Date", dmy)
data %<>% filter(Date >= "2007-02-01" & Date <= "2007-02-02")

# Combine Date and Time to plot energy sub metering against time of day
data %<>% mutate(Datetime = parse_date_time(paste(Date, Time),"ymd HMS"))

# Plot
png("plot3.png", width=480, height=480)

plot(x = data[, Datetime],
     y = data[, Sub_metering_1], 
     xlab = "",
     ylab = "Energy sub metering", 
     type = "l")
lines(x = data[, Datetime],
     y = data[, Sub_metering_2], 
     col = "red")
lines(x = data[, Datetime],
      y = data[, Sub_metering_3], 
      col = "blue")
legend("topright",
       c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
       col=c("black","red","blue"), 
       lty=1, lwd=1)

dev.off()
