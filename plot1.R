
fh2 = read.csv('household_power_consumption.txt', sep=";", na.strings="?")
subset_data = fh2[which(strptime(fh2$Date, "%d/%m/%Y") >= strptime("01/02/2007", "%d/%m/%Y") & strptime(fh2$Date, "%d/%m/%Y") <= strptime("02/02/2007", "%d/%m/%Y")),]

png("figure/plot1.png")
hist(subset_data$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power(kilowatts)")
dev.off()