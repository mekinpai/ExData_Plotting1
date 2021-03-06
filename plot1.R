# Load data
power_consumption = read.table(file = "household_power_consumption.txt", header=T, sep=";", na.strings = "?")

power_consumption$Date = as.Date(power_consumption$Date, format = "%d/%m/%Y")

power_consumption = subset(power_consumption, Date >= '2007-02-01' & Date <= '2007-02-02')

power_consumption$datetime = as.POSIXct(paste(power_consumption$Date, power_consumption$Time, sep = " "))

# Plot histogram of global active power to the screen
hist(power_consumption$Global_active_power, col="red" ,xlab = "Global Active Power (killowatts)", main = "Global Active Power")

# Copy the screen to the png file device
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
