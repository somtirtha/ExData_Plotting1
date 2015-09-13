fh2 = read.csv('household_power_consumption.txt', sep=";", na.strings="?")
subset_data = fh2[which(strptime(fh2$Date, "%d/%m/%Y") >= strptime("01/02/2007", "%d/%m/%Y") & strptime(fh2$Date, "%d/%m/%Y") <= strptime("02/02/2007", "%d/%m/%Y")),]

png("figure/plot4.png")
par(mfrow = c(2,2))
with(subset_data, {
    plot(Time, Global_active_power, ylab="Global active power")
    plot(Time, Voltage, ylab="Voltage")
    plot(Time, Sub_metering_1, ylab="Energy sub metering")
    with(subset_data, lines(Time, Sub_metering_2, col="red"))
    with(subset_data, lines(Time, Sub_metering_3, col="blue"))
    plot_colors <- c("black", "blue", "red")
    legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=plot_colors)
    plot(Time, Global_reactive_power, ylab="Global reactive power")
})
dev.off()