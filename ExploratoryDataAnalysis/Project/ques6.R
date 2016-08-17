library(ggplot2)
# Reading the data into a variable.
#pmdata <- readRDS("summarySCC_PM25.rds")

# Finding the data related to Coal combustion Emissions in Baltimore
baldata <- pmdata[pmdata$fips == '24510' & pmdata$type == "ON-ROAD",]

# Finding the data related to Coal combustion Emissions in Baltimore
losdata <- pmdata[pmdata$fips == '06037' & pmdata$type == "ON-ROAD",]

# Making the year column as a factor
baldata$year <- as.factor(baldata$year)
losdata$year <- as.factor(losdata$year)


# Finding the sum of emissions for each year
sum_data1 <- tapply(baldata$Emissions,baldata$year,FUN=sum)
sum_data2 <- tapply(losdata$Emissions,losdata$year,FUN=sum)


# Setting emissions in terms of thousand tons
sum_data1 <- sum_data1 / 1000
sum_data2 <- sum_data2 / 1000

# Points which are to be ticked
pts1 <- c(sum_data1[[1]],sum_data1[[2]],sum_data1[[3]],sum_data1[[4]],0)
pts2 <- c(sum_data2[[1]],sum_data2[[2]],sum_data2[[3]],sum_data2[[4]],0)

# Y-axis labels
yax1 <- round(pts2,2)
yax2 <- round(pts2,2)

# Create an empty frame and setting two columns for plotting
plot.new()
par(mfcol = c(1,2))

# Plotting two bar plots each for Baltimore County
barplot(sum_data1, yaxt = "n",xaxt = "n", main = "Baltimore City")
# Setting the Y-axis ticks
axis(2,at = pts1, labels = yax1, las = 2, cex.axis=0.6)
axis(1, at = c(0.7,1.9,3.1,4.4),labels = c("1999","2002","2005","2008"), cex.axis=0.6)
mtext(side = 1, text = "Year", line = 2.5, cex.axis = 0.6)
mtext(side = 2, text = "PM2.5  Emissions in thousand tons" , line = 3, cex.axis = 0.5)

# Plotting two bar plots each for Los Angeles County
barplot(sum_data2, yaxt = "n",xaxt = "n", main = "Los Angeles County")
axis(2,at = pts2, labels = yax2, las = 2, cex.axis=0.6)
axis(1, at = c(0.7,1.9,3.1,4.4),labels = c("1999","2002","2005","2008"), cex.axis=0.6)
mtext(side = 1, text = "Year", line = 2.5, cex.axis = 0.6)
mtext(side = 2, text = "PM2.5  Emissions in thousand tons" , line = 3, cex.axis = 0.5)

# Copying the plotted graph to a file names plot6.png as a png file
dev.copy(png, filename = "plot6.png")

# Finally closing the recently opened device png.
dev.off()