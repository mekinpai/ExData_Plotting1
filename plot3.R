# Load data
power_consumption = read.table(file = "household_power_consumption.txt", header=T, sep=";", na.strings = "?")

power_consumption$Date = as.Date(power_consumption$Date, format = "%d/%m/%Y")

power_consumption = subset(power_consumption, Date >= '2007-02-01' & Date <= '2007-02-02')

power_consumption$datetime = as.POSIXct(paste(power_consumption$Date, power_consumption$Time, sep = " "))

# Plot scatter plot of Energy sub metering and time categorized by meter devices to the screen
with(power_consumption, plot(datetime, Sub_metering_1, type="n", xlab = ""
                             , ylab = "Energy sub metering"))

with(power_consumption, lines(datetime, Sub_metering_1, col = "black"))
with(power_consumption, lines(datetime, Sub_metering_2, col = "red"))
with(power_consumption, lines(datetime, Sub_metering_3, col = "blue"))
legend("topright", lwd=1, col = c("black","blue", "red")
       , legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Copy the screen to the png file device
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()
