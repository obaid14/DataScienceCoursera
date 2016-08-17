
# Reading the data into a variable.
pmdata <- readRDS("summarySCC_PM25.rds")

# Reading the Source Classification Code
sccdata <- readRDS("Source_Classification_Code.rds")

# Finding the data related to Coal combustion Emissions
coaldata <- sccdata[grep("Coal",sccdata$Short.Name,ignore.case = TRUE),]

# Merging the data with the PM2.5 data based on the SCC
merged <- merge(coaldata,pmdata)

# Making the year column as a factor
merged$year <- as.factor(merged$year)

# Finding the sum of emissions for each year
sum_data <- tapply(merged$Emissions,merged$year,FUN=sum)

# Setting emissions in terms of million tons
sum_data <- sum_data / 1000000

# Points which are to be ticked
pts <- c(sum_data[[1]],sum_data[[2]],sum_data[[3]],sum_data[[4]],0)

# Y-axis labels
yax <- round(pts,2)

# Create an empty frame
plot.new()

par(mar = c(4,4,2,1))

# Plotting a bar plot for total emission for the city of Baltimore
barplot(sum_data, yaxt = "n", main = "Emissions of PM2.5 due to Coal Combustion in US (1999-2008)")

# Setting the Y-axis ticks
axis(2,at = pts, labels = yax, las = 2, cex.axis=0.6)

# Adding the X-axis label
mtext(side = 1, text = "Year", line = 2.5)

# Adding the Y-axis label
mtext(side = 2, text = "PM2.5  Emissions in thousand tons" , line = 3)

# Copying the plotted graph to a file names plot4.png as a png file
dev.copy(png, filename = "plot4.png")

# Finally closing the recently opened device png.
dev.off()