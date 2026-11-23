# Load and subset data for 2007-02-01 and 2007-02-02
data_file <- "household_power_consumption.txt"
power_data <- read.table(data_file, header = TRUE, sep = ";", na.strings = "?",
                         colClasses = c("character", "character", rep("numeric", 7)))

subset_data <- subset(power_data, Date %in% c("1/2/2007", "2/2/2007"))

# Combine Date and Time into POSIXct datetime
subset_data$Datetime <- strptime(paste(subset_data$Date, subset_data$Time), 
                                 format = "%d/%m/%Y %H:%M:%S")

# Open PNG device
png("plot4.png", width = 480, height = 480)

# Set 2x2 layout
par(mfrow = c(2, 2))

# Top-Left: Global Active Power
plot(subset_data$Datetime, subset_data$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power")

# Top-Right: Voltage
plot(subset_data$Datetime, subset_data$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

# Bottom-Left: Energy sub metering (no legend border)
plot(subset_data$Datetime, subset_data$Sub_metering_1,
     type = "l",
     col = "black",
     xlab = "",
     ylab = "Energy sub metering")
lines(subset_data$Datetime, subset_data$Sub_metering_2, col = "red")
lines(subset_data$Datetime, subset_data$Sub_metering_3, col = "blue")
legend("topright",
       lty = 1,
       bty = "n",
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Bottom-Right: Global Reactive Power
plot(subset_data$Datetime, subset_data$Global_reactive_power,
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power")

# Close device
dev.off()