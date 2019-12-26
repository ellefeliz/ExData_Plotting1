
data <- read.table("data/household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
subSet <- data[data$Date %in% c("1/2/2007","2/2/2007"),] 

dateTime <- strptime(paste(subSet$Date, subSet$Time), "%d/%m/%Y %H:%M:%S")
GAP <- as.numeric(subSet$Global_active_power)
png("plot2.png", width = 480, height = 480)
plot(dateTime, GAP, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()