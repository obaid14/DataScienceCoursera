complete <- function(directory, id = 1:332){
    output <- data.frame() #initialize a data frame
    for (i in id){
        name_csv <- sprintf("%03d",i)        #setting the name of csv files
        my_file <- paste0(directory,"/",name_csv,".csv") #specifying the path of all csv files.
        
        read_file <- read.csv(file = my_file, head = TRUE, sep = ",") # read the csv file
        
        file_withoutna <- read_file[complete.cases(read_file),]  # using complete cases to filter out NA values
        num <- nrow(file_withoutna)                              # finding the number of rows 
        output <- rbind(output, data.frame("id" = i,"nobs" = num)) #appending the results to output data frame
    }
    output    # returning the data frame
}