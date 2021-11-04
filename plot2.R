# Initialise
library(data.table)
library(magrittr)
library(dplyr)
library(lubridate)

# Read data, filter period
data <- fread("household_power_consumption.txt", na.strings="?")
data %<>% mutate_at("Date", dmy)
data %<>% filter(Date >= "2007-02-01" & Date <= "2007-02-02")

# Combine Date and Time to plot power against time of day
data %<>% mutate(Datetime = parse_date_time(paste(Date, Time),"ymd HMS"))

# Plot
png("plot2.png", width=480, height=480)

plot(x = data[, Datetime],
     y = data[, Global_active_power], 
     xlab = "",
     ylab = "Global Active Power (kilowatts)", 
     type = "l")

dev.off()
