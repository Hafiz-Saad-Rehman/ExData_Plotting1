## Plot 4
library(tidyverse)
a <- read.table(choose.files(), header = TRUE, 
                sep = ";", 
                na="?", 
                colClasses = c("character",
                               'character',
                               'numeric',
                               'numeric',
                               'numeric',
                               'numeric',
                               'numeric',
                               'numeric',
                               'numeric'))
my_data <- subset(a, Date == "2/2/2007" | Date == "1/2/2007")
my_data$POSIX <-as.POSIXlt.character(paste(my_data$Date,my_data$Time),format = "%d/%m/%Y %H:%M:%S")

png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
# top left
plot(my_data$POSIX ,my_data$Global_active_power, type = 'l', xlab='',ylab = 'Global Active Power (kilowatts)')
# top right
plot(my_data$POSIX ,my_data$Voltage, type = 'l', xlab='datetime',ylab = 'Voltage')
# bottom left
plot(x= my_data$POSIX, y= my_data$Sub_metering_1, 
     type= "l", col="black", xlab= "", ylab= "Energy sub metering")
lines(x= my_data$POSIX, y= my_data$Sub_metering_2, col="orange")
lines(x= my_data$POSIX, y= my_data$Sub_metering_3, col="dark blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col =c("black", "orange", "dark blue"), lty = 1, lwd = 2 )
# bottom right
plot(my_data$POSIX ,my_data$Global_reactive_power, type = 'l', xlab='datetime',ylab = 'Global Reactive Power')

dev.off()  ## closing off the png device/file/screen

