library(grid)
library(ggplot2)

a <-  read.csv("payments.csv", header = TRUE, sep = ",")
b <- a[,c(1,5,6,10,11)]
c <- b[b$Provider.City == "NEW YORK",]


pdf("plot1.pdf")
scatter.smooth(c$Average.Covered.Charges, c$Average.Total.Payments, pch = 20, xlab = "Mean Covered Charges", ylab = "Mean Total Payments", main = "Mean Covered Charges vs Total Payments for New York" )
dev.off()

