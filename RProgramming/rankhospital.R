rankhospital <- function(state,outcome,num="best"){
    
    #Valudating the outcome
    if(outcome == "heart attack"){ reason <- 11}
    else if(outcome == "heart failure") { reason <- 17}
    else if(outcome == "pneumonia") { reason <-23}
    else { stop ("Invalid outcome")}
    
    # Reading the data as a data frame into my_data and selecting the desired columns.
    my_data <- read.csv("C:/Users/mohammed.obaidullah/Documents/datasciencecoursera/RProgramming/assignment3/outcome-of-care-measures.csv",stringsAsFactor = FALSE, 
                        na.strings = "Not Available")[c(2,7,reason)]
    
    # Validating the states present
    if (!state %in% my_data[,"State"]) {
        stop("invalid state")
    }
    
    #Selecting the data pertaining to the state presented
    state_data <- my_data[my_data$State == state,]
    # Removing the na values.
    sub <- na.omit(state_data)
    # Ordering the data in increasing order or Mortality rate and then sorting them alphabetically
    final <- sub[order(sub[,3],as.character(sub[,1])),]
    #Returning the Hospital Name based on the rank given.
    if (num == "best") {  #if its best, then rank is 1
        return(final[1,1])
    }
    else if (num == "worst") { #if its worst, then rank is the lowest.
        return(final[nrow(final),1])
    }
    else {  #else return the rank based on the num given.
        return(final[num,1])
    }
    
}