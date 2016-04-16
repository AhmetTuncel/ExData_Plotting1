## txt data load

data_txt <- read.csv("./household_power_consumption.txt", header=TRUE, na.strings="?", sep=";", nrows=2075259, check.names=FALSE, stringsAsFactors=FALSE, comment.char="", quote="\"")

## Date formatting

data_txt$Date <- as.Date(data_txt$Date, format = "%d/%m/%Y")

data  <- subset(data_txt, subset=(Date >= "2007/02/01" & Date <= "2007/02/02"))
rm(data_txt)

datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot variable and then creating plot

plot(data$Sub_metering_1~data$Datetime, ylab="Energy sub metering", xlab="", type="l")

lines(data$Sub_metering_2~data$Datetime,col="Red")
lines(data$Sub_metering_3~data$Datetime, col="Blue")

legend("topright", legend=c("Sub_metering_1   ", "Sub_metering_2   ", "Sub_metering_3   "), col=c("Black", "Red", "Blue"), lty=1, lwd=2, cex = 0.4)

dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()