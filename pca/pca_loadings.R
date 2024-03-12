library(plotly)
library(dplyr)

load("bike.RData")

bike_quants <- bike %>% mutate(across(where(is.numeric),scale)) %>% select(is.numeric)
model <- prcomp(bike_quants[,colnames(bike_quants)!="cnt"])
s <- summary(model)

df <- data.frame(pc1=model$x[,1],
                 pc2=model$x[,2],
                 pc3=model$x[,3],
                 num_bikes=bike_quants$cnt)
g <- plot_ly(df,x=~pc1,y=~pc2,color=~num_bikes)
g <- g %>% add_markers(text=paste(9/5*bike$temp + 32,bike$hum))
g
