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

# Plot a line graph with Submetering_1 data on the y-axis
plot(filter_data$Sub_metering_1,type = "l", ylab = "Energy sub Metering", xlab = "", xaxt = "n" )

# Adding the submetereing_2 data with the color red
lines(filter_data$Sub_metering_2, col = "red")

# Adding the submetering_3 data with the color blue
lines(filter_data$Sub_metering_3, col = "blue")


# Setting the X-axis parameters
axis(side=1, at = c(0,1440,2880), labels = c("Thurs","Fri","Sat"), tck = -0.02)

# Adding a legend at the topright corner of the plot. 
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty = c(1,1,1),lwd= c(1,1,1))

# Copying the plotted graph to a file names plot1.png as a png file
dev.copy(png, filename = "plot3.png")

# Finally closing the recently opened device png.
dev.off()

# This program would now place the plot3.png file in the working directory.