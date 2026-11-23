# Load and subset data for 2007-02-01 and 2007-02-02
data_file <- "household_power_consumption.txt"
power_data <- read.table(data_file, header = TRUE, sep = ";", na.strings = "?",
                         colClasses = c("character", "character", rep("numeric", 7)))

subset_data <- subset(power_data, Date %in% c("1/2/2007", "2/2/2007"))

# Open PNG device
png("plot1.png", width = 480, height = 480)

# Construct Plot 1
hist(subset_data$Global_active_power,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")

# Close device
dev.off()