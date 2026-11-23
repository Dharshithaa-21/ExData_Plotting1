# Load and subset data for 2007-02-01 and 2007-02-02
data_file <- "household_power_consumption.txt"
power_data <- read.table(data_file, header = TRUE, sep = ";", na.strings = "?",
                         colClasses = c("character", "character", rep("numeric", 7)))

subset_data <- subset(power_data, Date %in% c("1/2/2007", "2/2/2007"))

# Combine Date and Time into POSIXct datetime
subset_data$Datetime <- strptime(paste(subset_data$Date, subset_data$Time), 
                                 format = "%d/%m/%Y %H:%M:%S")

# Open PNG device
png("plot2.png", width = 480, height = 480)

# Construct Plot 2
plot(subset_data$Datetime, subset_data$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

# Close device
dev.off()