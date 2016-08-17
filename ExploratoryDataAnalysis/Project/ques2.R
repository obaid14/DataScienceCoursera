# Reading the data into a variable.
pmdata <- readRDS("summarySCC_PM25.rds")

# Making the year column as a factor
pmdata$year <- as.factor(pmdata$year)

# Subsetting the Baltimore data
bal_data <- pmdata[pmdata$fips==24510,]

# Finding the sum of Emissions each year in the city of Baltimore
sum_data <- tapply(bal_data$Emissions,bal_data$year,FUN = sum)

# Points which are to be ticked
pts <- c(sum_data[[1]],sum_data[[2]],sum_data[[3]],sum_data[[4]],0)

# Yaxis labels
yax <- round(pts,2)

# Create an empty frame
plot.new()

# Setting the plot margins
par(mar = c(3.7,4.5,2.5,0.5))

# Plotting a bar plot for total emission for the city of Baltimore
barplot(sum_data, yaxt = "n", main = "Total Emissions of PM2.5 in Baltimore from 1999-2008")

# Setting the Y-axis ticks
axis(2,at = pts, labels = yax, las = 2, cex.axis=0.7)

# Adding the X-axis label
mtext(side = 1, text = "Year", line = 2.5)

# Adding the Y-axis label
mtext(side = 2, text = "PM2.5  Emissions in tons", line = 3.5)

# Copying the plotted graph to a file names plot2.png as a png file
dev.copy(png, filename = "plot2.png")

# Finally closing the recently opened device png.
dev.off()