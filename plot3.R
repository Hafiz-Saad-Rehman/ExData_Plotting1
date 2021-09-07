## Plot 3
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

png(filename = "plot3.png", width = 480, height = 480)
plot(x= my_data$POSIX, y= my_data$Sub_metering_1, 
     type= "l", col="black", xlab= "", ylab= "Energy sub metering")
lines(x= my_data$POSIX, y= my_data$Sub_metering_2, col="orange")
lines(x= my_data$POSIX, y= my_data$Sub_metering_3, col="dark blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col =c("black", "orange", "dark blue"), lty = 1, lwd = 2 )
dev.off()

