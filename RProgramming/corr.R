source("complete.R")
corr <- function(directory, threshold = 0){
    corr_vec <- c()     # initializing an empty vector
    id <- 1:332
    mydata <- complete("specdata")    #running the complete.R to find the number of complete cases
    n <- mydata[2]      # extracting the nobs column to compare with threshold
    for(i in id){
        x <- i       # setting the path to the files
        y <- sprintf("%03d",x)     # setting the path to the files
        fi <- paste0(directory,"/",y,".csv")     # setting the path to the  files
            
        corr_file <- read.csv(file = fi, header = TRUE, sep=",")   #reading the csv file in corr_file
        
        if(n[i,]>threshold){                            #if the complete cases for a particular file  
            d <- corr_file[complete.cases(corr_file),]  #is greater than threshold then we are 
            corr_vec <- c(corr_vec,cor(d[,2],d[,3]))    #calculating the correlation between the sulfates
        }                                               #and nitrates and adding the values to corr_vec vector
    }
    corr_vec           #finally, returning the vector containing the correlation values
}   
