
data <- read.table("data/household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
subSet <- data[data$Date %in% c("1/2/2007","2/2/2007"),] 

dateTime <- strptime(paste(subSet$Date, subSet$Time), "%d/%m/%Y %H:%M:%S")
GAP <- as.numeric(subSet$Global_active_power)
GRP <- as.numeric(subSet$Global_reactive_power)
voltage <- as.numeric(subSet$Voltage)
subMeter1 <- as.numeric(subSet$Sub_metering_1)
subMeter2 <- as.numeric(subSet$Sub_metering_2)
subMeter3 <- as.numeric(subSet$Sub_metering_3)

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
plot(dateTime, GAP, type = "l", xlab = "", ylab = "Global Acive Power", cex=0.2)
plot(dateTime, voltage, type = "l", xlab = "datetime", ylab="Voltage")

plot(dateTime, subMeter1, type = "l", xlab = "", ylab = "Energy Submetering")
lines(dateTime, subMeter2, type = "l", col = "red")
lines(dateTime, subMeter3, type = "l", col = "blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2.5, col = c("black", "red", "blue"), bty = "o")

plot(dateTime, GAP, type = "l", xlab = "datetime", ylab = "Global reactive power")

dev.off()