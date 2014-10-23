## Read data file
data <- read.table("household_power_consumption.txt",sep = ";",head=TRUE)
## Use only data from dates 2007-02-01 and 2007-02-02
data <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]
## Convert date and time columns into single datetime column
## Convert numeric columns
data$DateTime <- strptime(paste(data$Date,data$Time,sep=" ") , "%d/%m/%Y %H:%M:%S", tz="UTC")
data$Global_active_power <- as.numeric(levels(data$Global_active_power)[data$Global_active_power])
data$Global_reactive_power <- as.numeric(levels(data$Global_reactive_power)[data$Global_reactive_power])
data$Voltage <- as.numeric(levels(data$Voltage)[data$Voltage])
data$Sub_metering_1 <- as.numeric(levels(data$Sub_metering_1)[data$Sub_metering_1])
data$Sub_metering_2 <- as.numeric(levels(data$Sub_metering_2)[data$Sub_metering_2])
data$Sub_metering_3 <- as.numeric(levels(data$Sub_metering_3)[data$Sub_metering_3])

# Create Plot 4
png(filename = "Plot4.png", width = 480, height = 480)
# Prepare for 2x2 subplots
par(mfrow=c(2,2))
# Subplot 1
plot(data$DateTime,data$Global_active_power, type="l", ylab="Global Active Power", xlab="")
# Subplot 2
plot(data$DateTime,data$Voltage, type="l", ylab="Voltage", xlab="datetime")
# Subplot 3
plot(data$DateTime,data$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
with(data, points(DateTime, Sub_metering_1, type="l", col="black"))
with(data, points(DateTime, Sub_metering_2, type="l", col="red"))
with(data, points(DateTime, Sub_metering_3, type="l", col="blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")
# Subplot 4
plot(data$DateTime,data$Global_reactive_power, type="l", ylab="Global reactive Power", xlab="datetime")
dev.off()