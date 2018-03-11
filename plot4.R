download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="electric.zip")
data <- read.table(unz("electric.zip","household_power_consumption.txt"), nrows=2075259, header=T, sep=";", na.strings="?",stringsAsFactors=FALSE)
datetime <- paste(data$Date, data$Time, sep=" ")
data <- cbind(data, datetime)
data$datetime <- strptime(data$datetime, format="%d/%m/%Y %H:%M:%S")

graph <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

png(filename="plot4.png", width=480, height=480)

par(mfrow=c(2,2))
plot(graph$datetime, graph$Global_active_power, type="l", ylab="Global Active Power", xlab="")
plot(graph$datetime, graph$Voltage, type="l", ylab="Voltage", xlab="datetime")
plot(graph$datetime, graph$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(graph$datetime, graph$Sub_metering_2,col="red")
lines(graph$datetime, graph$Sub_metering_3,col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=1)
plot(graph$datetime, graph$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")


dev.off()