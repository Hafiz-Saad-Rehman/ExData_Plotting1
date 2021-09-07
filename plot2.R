## Plot 2
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

png(filename = "plot2.png", width = 480, height = 480)
plot(my_data$POSIX ,my_data$Global_active_power, type = 'l', xlab='',ylab = 'Global Active Power (kilowatts)')
dev.off()
