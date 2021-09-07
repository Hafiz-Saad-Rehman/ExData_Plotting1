library(tidyverse)
library(lubridate)
library(dplyr)

my_data <- my_data %>%
  mutate(Days = format(Date, format = "%a"))
my_data$Days <- as.factor(my_data$Days)

#4th plot & final one
plot(x = my_data$Days, y = my_data$Global_active_power, type = "b")
line(x = my_data$Days, y = my_data$Global_active_power, type = "i")

plot(x = my_data$Days, y = my_data$Global_active_power, type = "h")
hist(y = my_data$Days, x = my_data$Global_active_power)

xyplot(Global_active_power ~ Time | Days, data = my_data, layout = c(2,1))

ggplot(data = my_data, mapping = aes(x=Days, y= Global_active_power)) +
  geom_smooth(se = F,type = "i")