library(tidyverse)
a <- read.table(choose.files(), header = TRUE, sep = ";") # variable containing all data
a$Date <- as.Date(a$Date, "%d/%m/%Y") # turning date column as Date class
a$Time <- ts(a$Time)  # turning Time column as time class
my_data <- subset(a, Date == "2007-02-01" | Date == "2007-02-02")
View(my_data)
my_data$Global_active_power <- as.numeric(my_data$Global_active_power)
my_data$Global_reactive_power <- as.numeric(my_data$Global_reactive_power)
my_data$Voltage <- as.numeric(my_data$Voltage)


# 1st plot
plot_1 <- hist(my_data$Global_active_power, col = "red", 
               xlab = "Global Active Power (kilowatts)",
               main = "Global Active Power")  
png(file = "plot1.png", width = 480, height = 480)
hist(my_data$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")
dev.off()