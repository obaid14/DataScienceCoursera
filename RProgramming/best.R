best <- function(state,outcome){
    
    my_data <- read.csv("C:/Users/mohammed.obaidullah/Documents/datasciencecoursera/RProgramming/assignment3/outcome-of-care-measures.csv")
    
    if(outcome == "heart attack") { reason <- 11}
    else if(outcome == "heart failure") { reason <- 17}
    else if(outcome == "pneumonia") { reason <- 23}
    else { stop("Invalid outcome")}
    
    for(i in levels(my_data$State)){
        if( i == state){ 
            flag <- TRUE 
            st <- i
            break
        }
        else { flag <- FALSE}
    }
    
    if(flag == FALSE) {
        stop("Invalid State")
    }
    
    req_data <- my_data[,c(2,7,reason)]
    state_data <- subset(req_data,req_data["State"]== st)
    rate <- state_data[,3]
    temp <- suppressWarnings(as.numeric(levels(rate)[rate]))
    temp1 <- temp[!is.na(temp)]
    
    low <- min(temp1)
    
    final_data <- subset(state_data,as.vector(state_data[,3])==low)
    final <- final_data[order(final_data[1]),]
    result <- final[1,1]
    result
}