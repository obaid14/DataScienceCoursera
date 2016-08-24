# Reading the data from the csv file
act <- read.csv("activity.csv", header = TRUE,sep=",")

# Replacing the na values as 0
act[is.na(act)] <- 0

# Calcuulating the total steps taken each day
step_day <- aggregate(steps ~ date, act, sum)
step_day$date <- as.Date(step_day$date)

# Plotting a histogram of the total steps taken on each day
ggplot(step_day,aes(date,steps)) + geom_bar(stat = "identity") + 
    labs(title = "Histogram of Total Steps taken each day" , x = "Date", y = "Number of Steps") + 
    theme_bw() + theme(axis.text.x = element_text(angle=90)) + 
    scale_x_date(breaks = step_day$date , labels =date_format("%d-%m"))

# Finding the average number of steps taken each day
mean_day <- aggregate(steps ~ date, act, mean)
# Finding the median number of steps taken each day
median_day <- aggregate(steps ~ date, act, median)



# Finding the average steps withing each 5 minute interval
interval_step <- aggregate(steps ~ interval, act, mean)

# Plotting the time series plot.
ggplot(interval_step, aes(interval,steps)) + geom_line() + 
    labs(title="Time Series Plot", x = "Interval", y = "Average Steps taken")

# Finding the interval with the max average number of steps taken
interval_step[interval_step$interval == max(interval_step$interval),]


# Finding the number of rows with NA's
with_na <- read.csv("activity.csv", header = TRUE,sep=",")
sum(is.na(with_na))

# Replacing all NA with the average steps taken in that interval
for( i in 1:nrow(with_na)){
    if(is.na(with_na$steps[i])){
        with_na$steps <- interval_step[which(with_na$interval[i]==interval_step$interval),]$steps
    }
}


# Calculating the total steps taken each day(modified)
# Calcuulating the total steps taken each day (modified)
modified_data <- aggregate(steps ~ date, with_na, sum)
modified_data$date <- as.Date(modified_data$date)

png("ModifiedHistogramOfTotalStepsTakenEachDay.png")
# Plotting a histogram of the total steps taken on each day
ggplot(modified_data,aes(date,steps)) + geom_bar(stat = "identity") + 
    labs(title = "Histogram of Total Steps taken each day" , x = "Date", y = "Number of Steps") + 
    theme_bw() + theme(axis.text.x = element_text(angle=90)) + 
    scale_x_date(breaks = modified_data$date , labels =date_format("%d-%m"))
dev.off()

# Finding the average number of steps taken each day
modified_mean <- aggregate(steps ~ date, with_na, mean)
# Finding the median number of steps taken each day
modified_meidan <- aggregate(steps ~ date, with_na, median)

# Making the date variable as factor
with_na$date <- as.Date(with_na)
# Adding a new column which will have the weekday
with_na$weekday <- weekdays(with_na$date)

for(i in 1:nrow(with_na)){
    if(with_na[i,]$weekday %in% c("Monday", "Tuesday", "Wednesday","Thursday","Friday")){
        with_na[i,]$weekday <- "Weekday"
    }
    else
        with_na[i,]$weekday <- "Weekend"
}

# Making the weekday variable as factor
with_na$weekday <- as.factor(with_na$weekday)

# Finding the average steps based on the intervals
int_steps <- aggregate(steps~interval+weekday,d,mean)

# Plotting the panel plot of number of steps in each interval 
# factored by weekdays and weekends
ggplot(int_steps,aes(interval,steps)) + geom_line() + facet_grid(weekday ~ .) 
   + labs(title = "Steps taken averaged over weekdays and weekends", 
         x = "Interval" , 
         y = "Number of Steps")

