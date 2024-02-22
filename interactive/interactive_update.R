library(plotly)
library(tidyquant)

getSymbols("NFLX", from="2019-1-1",to="2021-1-1")

df <- data.frame(NFLX$NFLX.High,NFLX$NFLX.Low,NFLX$NFLX.Close)
df$Date <- as.Date(rownames(df))
rownames(df) <- NULL
colnames(df) <- c("H","L", "C","Date")

data_args <- list(visible=c(F,F,T))
layout_args <- list(title="Close")
button_1 <- list(method="update",args=list(data_args,layout_args))
menu_1 <- list(type="buttons",active=-1,buttons=list(button_1))

f <- plot_ly(data=df,x=~Date)
f <- f %>% add_trace(type="scatter",mode="lines",y=~H,line=list(color="green"))
f <- f %>% add_trace(type="scatter",mode="lines",y=~L,line=list(color="red"))
f <- f %>% add_trace(type="scatter",mode="lines",y=~C,line=list(color="blue"))
f <- f %>% layout(f,updatemenus=list(menu_1))
f



