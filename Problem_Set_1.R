mean_accumulator <- function() {
  # initialize variables for sum of data points (sigma) and number of observations (n)
  # set values to zero if not previously invoked
  sigma <- 0
  n <- 0
  
  # update sigma and n with additional values, if applicable
  function(mydata=NULL){
    if (!is.null(mydata)){
      n <<- n + length(mydata)
      sigma <<- sigma + sum(mydata)
    }
    # re-calculate mean with latest update to sigma and n
    sigma / n
  }
}

std_accumulator <- function(){
  
  # initialize variables for sum of data points (sigma), sum of squared data points (sumsq),
  # and number of observations (n)
  # set values to zero if not previously invoked
  
  n <- 0  
  sumsq <- 0
  sigma <- 0
  
  # update sigma, sumsq, and n with additional values, if applicable
  function(mydata=NULL){
    if(!is.null(mydata)){
      sumsq <<- sumsq + sum(mydata^2)
      sigma <<- sigma + sum(mydata) 
      n <<- n + length(mydata)
    }
    
    # return rolling standard deviation
    sqrt((sumsq / n - (sigma / n)^2) * n / (n-1))
  }
}