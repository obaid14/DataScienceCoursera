rankall <- function(outcome, num ="best"){
    result <- vector()
    #Valudating the outcome
    if(outcome == "heart attack"){ reason <- 11}
    else if(outcome == "heart failure") { reason <- 17}
    else if(outcome == "pneumonia") { reason <-23}
    else { stop ("Invalid outcome")}
    
    my_data <- read.csv("C:/Users/mohammed.obaidullah/Documents/datasciencecoursera/RProgramming/assignment3/outcome-of-care-measures.csv",stringsAsFactor = FALSE, 
                        na.strings = "Not Available")[c(2,7,reason)]
    
    st <- unique(my_data[,2])
    
    for(i in st){
    #Selecting the data pertaining to the state presented
    state_data <- my_data[my_data$State == i,]
    # Removing the na values.
    sub <- na.omit(state_data)
    # Ordering the data in increasing order or Mortality rate and then sorting them alphabetically
    final <- sub[order(sub[,3],as.character(sub[,1])),]
    #Returning the Hospital Name based on the rank given.
    if (num == "best") {  #if its best, then rank is 1
        result <- c(result,final[1,1])
    }
    else if (num == "worst") { #if its worst, then rank is the lowest.
        result <- c(result, final[nrow(final),1])
    }
    else {  #else return the rank based on the num given.
        result <- c(result, final[num,1])
    }
    }
    data_f <- data.frame(result,as.vector(unique(my_data[,2])))
    data_f
}