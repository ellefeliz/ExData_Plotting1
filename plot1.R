
data <- read.table("data/household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
subSet <- data[data$Date %in% c("1/2/2007","2/2/2007"),] 

GAP <- as.numeric(subSet$Global_active_power)
png("plot1.png", width = 480, height = 480)
hist(GAP, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()