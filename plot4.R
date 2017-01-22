# Load data
power_consumption = read.table(file = "household_power_consumption.txt", header=T, sep=";", na.strings = "?")

power_consumption$Date = as.Date(power_consumption$Date, format = "%d/%m/%Y")

power_consumption = subset(power_consumption, Date >= '2007-02-01' & Date <= '2007-02-02')

power_consumption$datetime = as.POSIXct(paste(power_consumption$Date, power_consumption$Time, sep = " "))

# set the display to show 4 plots at the same time
par(mfrow = c(2, 2))

# First plot Global Active Power and Time
with(power_consumption, plot(datetime, Global_active_power, type="l", xlab = ""
                             , ylab = "Global Active Power"))

# Second plot Voltage and time
with(power_consumption, plot(datetime, Voltage, type="l", xlab = "datetime"
                             , ylab = "Voltage"))

# Third plot Energy sub metering and time categorized by meter devices
with(power_consumption, plot(datetime, Sub_metering_1, type="n", xlab = ""
                             , ylab = "Energy sub metering"))

with(power_consumption, lines(datetime, Sub_metering_1, col = "black"))
with(power_consumption, lines(datetime, Sub_metering_2, col = "red"))
with(power_consumption, lines(datetime, Sub_metering_3, col = "blue"))
legend("topright", lwd=1, col = c("black","blue", "red")
       , legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n",cex=0.75)

# Fouth plot Global reactive power and time
with(power_consumption, plot(datetime, Global_reactive_power, type="l", xlab = "datetime"
                             , ylab = "Global_reactive_power"))

# Copy the screen to the png file device
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()

