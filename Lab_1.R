#install.packages("dplyr")
#install.packages("ggplot2")

library(dplyr)
library(ggplot2)

setwd("~/Desktop/Data_Mining")

flats <- read.csv ( "flats.csv", stringsAsFactors = FALSE, dec = ".")
class(flats)

str(flats)

#Find the number of measurement in flats dataframe.

dim(flats)

#first six rows 
head(flats, n=6)

#la
tail(flats, n=15)

#names of data frames 
names(flats)

# Get a glimpse of flats
glimpse(flats)	


#count of flats by city
count(flats, City)

#Find count of flats by square
count(flats, Square)

#count of flats by city(sorted)
flats %>% count(City) %>% arrange(n)

flats %>% filter(City != "Lviv") %>% filter(Room == 3) %>% count(City) %>% arrange(desc(n))

flats %>% filter(Room == 2) %>% filter(City != "Lviv") %>% count(City) %>% arrange(desc(n))

flats %>% filter(Room == 2) %>% filter(City != " Kiev Svyatoshinsky") %>% summarise(mean(Square))

flats %>% filter(Room == 2) %>% filter(City != "Kharkiv") %>% summarise(mean(Square), sd(Square))

flats %>% filter(Room == 1) %>% filter(City!= "Kharkiv") %>% group_by(City) %>% summarise(mean=median(Square), sd=sd(Square))

#How many variables in a dataset flats?
ncol(flats)

#How many cities in the dataset flats?
nrow(flats %>% count(City))

#How many three-bedroom apartments for sale in Odessa?
nrow(flats %>% filter(City == "Odessa") %>% filter(Room == 3))

#What is the median area one-room apartment in Lviv?

flats %>% filter(City == "Lviv") %>% filter(Room == 1) %>% summarize(mean(Square))

#Find dispersion of Price for all flats in Lviv with 2 rooms (use function var in summarise)

flats %>% filter(City == "Lviv") %>% filter(Room == 2) %>% summarise((var=median(Price)), sd=sd(Price))



ggplot(flats, aes(x=Room)) + geom_bar(fill="lightblue", col="grey") + ylab(' Number ')


p <- ggplot(flats, aes(x= Square)) + geom_bar(fill="lightblue",col="grey") + ylab(' Number ')
p

ggplot(flats, aes(x=Square)) +
  
  geom_histogram(breaks=seq(0, 250, by = 25),
                 fill="lightblue",
                 
                 col="grey") +ylab('Number')



#Build scattering schedule that reflects the dependence of the price of the total area
ggplot(flats, aes(x=Square, y= Price)) +
  geom_point()


#Construct a histogram for assessing price allocation of flats

p <- ggplot(flats, aes( x= Price)) + geom_bar(fill="lightblue",col="grey") + ylab(' Number ')
p

#Construct a box-like diagram for price visualization allocation based on the number of rooms
ggplot(flats) + geom_boxplot(aes(factor(Room), y=Price)) + coord_flip()
