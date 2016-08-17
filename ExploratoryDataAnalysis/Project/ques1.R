
# Reading the data into a variable.
pmdata <- readRDS("summarySCC_PM25.rds")

# Making the year column as a factor
pmdata$year <- as.factor(pmdata$year)

# Subsetting the data and collecting only Emissions data with year.
sub_data <- subset(pmdata,select = c("Emissions","year"))

# Finding the sum of emissions for each year
sum_data <- tapply(sub_data$Emissions,sub_data$year,FUN= sum)

# Setting emissions in terms of million tons
sum_data <- sum_data / 1000000

# Yaxis labels
yax <- round(sum_data,2)

# The points where the ticks are to be positioned
pts <- c(yax[[1]],yax[[2]],yax[[3]],yax[[4]],0)

# Create an empty frame
plot.new()

# Setting the margin for the plot.
par(mar = c(4,4,2,1))

# Adding a barplot with the total emissions on Y-axis and Year on X-axis
barplot(sum_data, main = "Total emissions from PM2.5 in USA", 
        ylab = "Total emissions (in million tons)", xlab = "Years",  yaxt = "n")

# Setting the Y-axis labels and ticks
axis(2,at = pts, labels = pts,las=2, cex.axis = 0.7)

# Copying the plotted graph to a file names plot1.png as a png file
dev.copy(png, filename = "plot1.png")

# Finally closing the recently opened device png.
dev.off()