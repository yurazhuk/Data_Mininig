library(ggplot2)
library(cowplot)
require(reshape2)
#install.packages("cowplot")




df<-read.csv("http://vincentarelbundock.github.io/Rdatasets/csv/plm/Produc.csv", header= TRUE, sep=",")
options(warn=-1)
df$priv_over_pub <- with(df, pc / gsp)
df_sub<-subset(df, select=c(state, year, unemp,priv_over_pub))

df_sub_temp <- melt(df ,  id.vars = 'year', variable.name = 'series')

iris1 <- ggplot(df, aes(x=year, y=priv_over_pub)) + geom_bar(stat = "identity")

iris2 <- ggplot(df_sub, aes(x=year, y=priv_over_pub)) + geom_bar(stat = "identity")

plot_grid(iris1, iris2, labels = "AUTO")

