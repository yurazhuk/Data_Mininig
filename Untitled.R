#setting work direcory: 
setwd("/Users/yurazhuk/Desktop/Data_Mining/")

# import dataset 
m1<-read.csv("https://archive.ics.uci.edu/ml/machine-learning-databases/mushroom/agaricus-lepiota.data", header= FALSE, sep=",")
options(warn=-1)

#create subset of data and rename the empty column with appropriate fieldnames.
m2 <- m1[,c("V1","V4", "V22", "V23")]
colnames(m2) <- c("class", "color", "population","habitat")

#Create a lookuptable csv that defines each character values associated with each field.
lu<-read.csv("mushrooms1.csv", sep=",")

lu$concat <- do.call(paste, c(lu[c("class", "odor")], sep = "")) 
m2$concat_class <- paste("class",m2$class)
m2$concat_color <- paste("color",m2$color)
m2$concat_population <- paste("population",m2$population)
m2$concat_habitat <- paste("habitat",m2$habitat)