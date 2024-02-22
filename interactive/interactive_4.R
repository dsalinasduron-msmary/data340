library(plotly)
library(tidyquant)

getSymbols("AAPL",from="2007-2-1",to="2008-2-1")

df <- data.frame(AAPL$AAPL.High,AAPL$AAPL.Close)
df$Date <- as.Date(rownames(df))
rownames(df) <- NULL
colnames(df) <- c("High","Low","Date")


args_1 <- list("marker.color","red")
args_2 <- list("marker.color","green")


slider_step1 = list(args=args_1, method="restyle",value="1")
slider_step2 = list(args=args_2, method="restyle",value="2")

all_steps = list(slider_step1, slider_step2)

the_slider = list(active="1",steps=all_steps)

fig <- plot_ly(data=df)
fig <- fig %>% add_trace(x=~Date,y=~High)
fig <- fig %>% layout(sliders=list(the_slider))
fig

