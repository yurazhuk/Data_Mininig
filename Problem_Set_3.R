samples_test = function(n, dataset){
  samples = vector('double')
  
  #For 1000 iterations
  for(i in 1:1000){
    samples = append(samples, mean(sample(dataset,n)))
  }
  
  
  # Histogram in frequency
  hist(samples,breaks = n)
  
  #Samples Histogram with Bell curve - density
  samples = sort(samples)
  hist(samples, freq = FALSE,ylim = c(0, 8))
  x <- samples
  y <- dnorm(x = samples, mean = mean(samples), sd = sd(samples))
  lines(x = x, y = y, col = "blue")
  
  print(sd(samples)/sqrt(n))
}

#Call the function for 30 samples
samples_test(30,pdf1)