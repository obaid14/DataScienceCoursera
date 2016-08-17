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

# Dividing the plot frame into 4 frames row-wise
par(mfrow = c(2,2))
# Setting the margins for each sub-frame
par(mar = c(3,3,1,1))

#Plot 1
# Plotting a line graph for Global Active Power against the Days of the Week.
plot(filter_data$Global_active_power, type= "l",xaxt='n',yaxt = 'n', ylab = "", xlab = "")

# Setting the Y-axis parameters
axis(side=2, at = c(0,2,4,6), labels = c('0','2','4','6'), tck = -0.02, cex.axis = 0.8)

# Setting the Title for Y-axis and its parameters
title(ylab = "Global Active Power" , cex.lab = 1, mgp = c(2,0,0))

# Setting the X-axis parameters
axis(side=1, at = c(0,1440,2880), labels = c('Thu','Fri','Sat'), tck = -0.02, cex.axis = 0.8, mgp = c(1,0,0))



#Plot 2
# Plotting a line graph for Voltage against the Days of the Week.
plot(filter_data$Voltage, type= "l",xaxt='n',yaxt = 'n', ylab = "", xlab = "")

# Setting the Y-axis parameters
axis(side=2, at = c(234,236,238,240,242,244,246), labels = c('234','','238','','242','','246'), tck = -0.02, cex.axis = 0.8)

# Setting the Title for Y-axis and its parameters
title(ylab = "Voltage" , cex.lab = 1, mgp = c(2,0,0))

# Setting the X-axis parameters
axis(side=1, at = c(0,1440,2880), labels = c('Thu','Fri','Sat'), tck = -0.02, cex.axis = 0.8, mgp = c(1,0,0))

# Setting the Title for X-axis and its parameters
title(xlab = "datetime" , cex.lab = 1, mgp = c(1,0,0))


#Plot 3
# Plotting 3 line graphs for each submetering parameter against the Days of the Week.
plot(filter_data$Sub_metering_1,type = "l", xaxt = "n" , yaxt = "n", ylab = "",xlab ="")
lines(filter_data$Sub_metering_2, col = "red")
lines(filter_data$Sub_metering_3, col = "blue")

# Setting the Y-axis parameters
axis(side=2, at = c(0,10,20,30), labels = c('0','10','20','30'), tck = -0.02, cex.axis = 0.8)

# Setting the Title for Y-axis and its parameters
title(ylab = "Energy Sub Metering" , cex.lab = 1, mgp = c(2,0,0))

# Setting the X-axis parameters
axis(side=1, at = c(0,1440,2880), labels = c('Thu','Fri','Sat'), tck = -0.02, cex.axis = 0.8, mgp = c(1,0,0))

# Adding a legend at the topright corner of the plot.
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty = c(1,1,1),lwd= c(1,1,1), cex = 0.65)



#Plot 4
# Plotting a line graph for Global Reactive Power against the Days of the Week.
plot(filter_data$Global_reactive_power, type= "l",xaxt='n',yaxt = 'n', ylab = "", xlab = "")

# Setting the Y-axis parameters
axis(side=2, at = c(0.0,0.1,0.2,0.3,0.4,0.5), labels = c('0.0','0.1','0.2','0.3','0.4','0.5'), tck = -0.02, cex.axis = 0.8)

# Setting the Title for Y-axis and its parameters
title(ylab = "Global Reactive Power" , cex.lab = 1, mgp = c(2,0,0))

# Setting the X-axis parameters
axis(side=1, at = c(0,1440,2880), labels = c('Thu','Fri','Sat'), tck = -0.02, cex.axis = 0.8, mgp = c(1,0,0))

# Setting the Title for X-axis and its parameters
title(xlab = "datetime" , cex.lab = 1, mgp = c(1,0,0))

# Copying the plotted graph to a file names plot1.png as a png file
dev.copy(png, filename = "plot4.png")

# Finally closing the recently opened device png.
dev.off()

# This program would now place the plot4.png file in the working directory.