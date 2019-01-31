library (dplyr) 
library (ggplot2)
setwd('~/LAB2')

movie_body_counts <- read.csv ( 'filmdeathcounts.csv')

movie_body_counts$body_per_min <- movie_body_counts$Body_Cou nt/movie_body_counts$Length_Minutes

ggplot(movie_body_counts, aes(x=Body_Count)) + geom_histogram(bins=20, color="grey", fill="lightblue")

movie_body_counts %>% top_n(n = 10, Body_Count) %>% arrange(desc(Body_Count))

ggplot(movie_body_counts, aes(x=IMDB_Rating)) + geom_histogram(bins=10, color="grey", fill="lightblue")

movie_body_counts %>% top_n(n = 10, body_per_min) %>% arrange(desc(body_per_min))

imdb_mean <- mean(movie_body_counts[["IMDB_Rating"]])

imdb_sd <- sd(movie_body_counts[["IMDB_Rating"]])

set.seed(900)

imdb_simulation <- rnorm(n=nrow(movie_body_counts), mean = imdb_mean, sd = imdb_sd)

movie_body_counts$imdb_simulation <- imdb_simulation

ggplot(movie_body_counts, aes(x=imdb_simulation)) + geom_histogram(bins=10, color="grey", fill="lightblue")

ggplot(movie_body_counts, aes(sample = imdb_simulation)) + stat_qq()

ggplot(movie_body_counts, aes(sample = IMDB_Rating)) + stat_qq()

