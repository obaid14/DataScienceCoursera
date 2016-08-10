pollutantmean <- function(directory, pollutant, id = 001:332){
    final <- c()
    for (i in id){
        name_csv <- sprintf("%03d",i)
        my_file <- paste0(directory,"/",name_csv,".csv") #specifying the path of all csv files.
        
        read_file <- read.csv(file = my_file, head = TRUE, sep = ",") # read the csv file
        
        pollutantvec <- read_file[,pollutant]  #creates a vector of sulfate or nitrate values
        
        pollutantvec <- pollutantvec[!is.na(pollutantvec)] #removes all the NA values from this vector
        final <- c(final,pollutantvec)         
    }
    mean(final) #provides the mean of the pollutant for all the monitors.
}