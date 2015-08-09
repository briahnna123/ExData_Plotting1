# Plot_4 code

# Making Plots
# For each plot you should Construct the plot and save it to a PNG file with a 
# width of 480 pixels and a height of 480 pixels. Name each of the plot files as 
# plot1.png, plot2.png, etc.

# Step 1: Bring in the data to manipulate
setwd("~/Desktop") # Set WD
files <- file("household_power_consumption.txt") # Bring in file
power_data <- read.table(files, header=T, sep=";") # Read data into table


# Step 2: We need to "clean" the data; making tidy data
# Convert the Time format to: Day, Month, Year
power_data$Date <- as.Date(power_data$Date, format="%d/%m/%Y")


# Step 3: Subset the data to the dates we will only me manipulating 
# Here we are saying we want all Columns were data is between sepcific dates
data<- power_data[power_data$Date >= as.Date("2007-02-01") & power_data$Date<=as.Date("2007-02-02"),]
data <- transform(data, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")


# Step 4: Make Columns Classes numeric
data$Global_active_power<- as.numeric(as.character(data$Global_active_power))

# Step 5: Make Histogram
png(filename= "plot2.png", width=480, height=480, units="px")
plot(data$timestamp, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off() # Show graph in WD
