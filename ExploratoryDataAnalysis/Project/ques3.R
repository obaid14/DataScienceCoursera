library(ggplot2)

# Reading the data into a variable.
pmdata <- readRDS("summarySCC_PM25.rds")

# Making the year column as a factor
pmdata$year <- as.factor(pmdata$year)

# Subsetting the Baltimore data
bal_data <- pmdata[pmdata$fips==24510,]

# Setting type variable as factor
bal_data$type <- as.factor(bal_data$type)

# Create an empty frame
plot.new()

# Plotting using ggplot
graph <- ggplot(bal_data,aes(year)) + geom_bar() + facet_wrap(~type) + 
    ylab("PM2.5 Emissions in tons") + xlab("Years (1999-2008)") + 
    ggtitle("PM2.5 Emissions data by type for Baltimore City (1999-2008")

# Printing the graph
print(graph)

# Copying the plotted graph to a file names plot3.png as a png file
dev.copy(png, filename = "plot3.png")

# Finally closing the recently opened device png.
dev.off()

