##Load the data (data contains only the required two days)
require(data.table)
data<-fread("household_power_consumption_small.txt", sep=";")

## Merge date and time into a DateTime column
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S") 

## Make the plot
par(mar=c(5,5,5,5))
plot(data$DateTime, data$Global_active_power, type="n", xlab="", ylab="Global Active Power (kilowatts)")
lines(data$DateTime, data$Global_active_power)

## Copy the plot to png file
dev.copy(device=png, file="plot2.png")
dev.off()