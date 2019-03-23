random_val = function() {
  
  #Uncomment for dataframe and creating dynamic value from input 
  # return(data.frame(x, col=ifelse(x >1 & x <=2,2-x, x) ))
  
  #Generate 1 random value between 0 to 2
  x = runif(1, 0,2)
  
  #Apply the given pdf1 function
  return(ifelse(x >1 & x <=2,2-x, x) )
  
}

#test the function
random_val()

random_val1 = function() {
  #Generate 1 random value between 0 to 2
  x = runif(1, 0,2)
  
  #Apply the given pdf1 function
  return(ifelse(x >=0 & x <=1, 1 - x, ifelse(x > 1 & x <= 2, x-1,x)) )
}

#test the function
random_val1()