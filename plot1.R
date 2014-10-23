## Read data file
data <- read.table("household_power_consumption.txt",sep = ";",head=TRUE)
## Use only data from dates 2007-02-01 and 2007-02-02
data <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]
## Convert date and time columns into single datetime column
## Convert numeric columns
data$DateTime <- strptime(paste(data$Date,data$Time,sep=" ") , "%d/%m/%Y %H:%M:%S")
data$Global_active_power <- as.numeric(levels(data$Global_active_power)[data$Global_active_power])

# Create Plot 1
png(filename = "Plot1.png", width = 480, height = 480)
hist(data$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")
dev.off()