##Load the data (data contains only the required two days)
require(data.table)
data<-fread("household_power_consumption_small.txt", sep=";")

## Merge date and time into a DateTime column
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S") 

## Make the plot
par(mar=c(5,5,5,5))
hist(data$Global_active_power, col="red", main="Global Active Power", xlab= "Global Active Power (kilowatts)")

## Copy the plot to png file
dev.copy(device=png, file="plot1.png")
dev.off()