# Load the data into a dataframe names house_data with string as factors false.
house_data <- read.table("household_power_consumption.txt",sep = ";",header = TRUE,stringsAsFactors = FALSE)

# Format the date variable in the dataframe as dd-mm-yyyy
house_data$Date <- strptime(house_data$Date, "%d/%m/%Y")

# Since we want data only from 01-02-2007 to 02-02-2007
# we fix startdate and enddate and apply it as a filter to our dataframe
startdate <- as.POSIXlt("2007-02-01")
enddate <- as.POSIXlt("2007-02-02")

# Now we filter the data based on the dates available.
filter_data <- house_data[house_data$Date>=startdate & house_data$Date <= enddate,]

# Create an empty frame
plot.new()

# Plotting the line graph of Global Active Power against the Days of the Week
plot(filter_data$Global_active_power, type= "l",xaxt = 'n', ylab = "Global Active Power (kilowatts)", xlab="")

# Dividing the x-axis into weekdays.
axis(side=1, at = c(0,1440,2880), labels = c("Thu","Fri","Sat"), tck = -0.02)

# Copying the plotted graph to a file names plot1.png as a png file
dev.copy(png, filename = "plot2.png")

# Finally closing the recently opened device png.
dev.off()

# This program would now place the plot2.png file in the working directory.