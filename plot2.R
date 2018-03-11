download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="electric.zip")
data <- read.table(unz("electric.zip","household_power_consumption.txt"), nrows=2075259, header=T, sep=";", na.strings="?",stringsAsFactors=FALSE)
datetime <- paste(data$Date, data$Time, sep=" ")
data <- cbind(data, datetime)
data$datetime <- strptime(data$datetime, format="%d/%m/%Y %H:%M:%S")

graph <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

png(filename="plot2.png", width=480, height=480)

plot(graph$datetime, graph$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

dev.off()