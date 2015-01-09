##Load the data (data contains only the required two days)
require(data.table)
data<-fread("household_power_consumption_small.txt", sep=";")

## Merge date and time into a DateTime column
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S") 

## Make the plot

par(mar=c(2.5,5,1,1))
par(mfrow=c(2,2))
plot(data$DateTime, data$Global_active_power, type="n", xlab="", ylab="Global Active Power", cex.lab=0.7, cex.axis=0.7)
lines(data$DateTime, data$Global_active_power)
plot(data$DateTime, data$Voltage, type="n", xlab="datetime", ylab="Voltage", cex.lab=0.7, cex.axis=0.7)
lines(data$DateTime, data$Voltage)
plot(data$DateTime, data$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering", cex.lab=0.7, cex.axis=0.7)
lines(data$DateTime, data$Sub_metering_1, col="black")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"), cex=0.5)
plot(data$DateTime, data$Global_reactive_power, type="n", xlab="datetime", ylab="Global_reactive_power", cex.lab=0.7, cex.axis=0.7)
lines(data$DateTime, data$Global_reactive_power)

## Copy the plot to png file
dev.copy(device=png, file="plot4.png")
dev.off()