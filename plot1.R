# Initialise
library(data.table)
library(magrittr)
library(dplyr)
library(lubridate)

# Read data, filter period
data <- fread("household_power_consumption.txt", na.strings="?")
data %<>% mutate_at("Date", dmy)
data %<>% filter(Date >= "2007-02-01" & Date <= "2007-02-02")

# Plot
png("plot1.png", width=480, height=480)

hist(data[, Global_active_power], 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", 
     col = "Red")

dev.off()
