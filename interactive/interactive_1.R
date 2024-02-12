library(plotly)
library(tidyquant)

getSymbols("AAPL", from="2007-6-1", to="2008-6-1")

df <- data.frame(AAPL$AAPL.Close)
df$date <- as.Date(index(AAPL))
df$log2 <- log(as.numeric(AAPL$AAPL.Close),base=2)
colnames(df) <- c("close","date","log2")
rownames(df) <- NULL

on_args <- list(visible=c(F,T))
off_args <- list(visible=c(T,F))
layout_on <- list(title="log")
layout_off <- list(title="dollar")
button1 <- list(method = "update",
                args2 = list(on_args,layout_on),
                args = list(off_args,layout_off),
                label="log")
buttons <- list(type="buttons",buttons=list(button1))
u <- list(buttons)

fig <- plot_ly(data=df,x=~df$date)
fig <- fig %>% add_trace(type="scatter", mode="lines",y=~close,name="dollar")
fig <- fig %>% add_trace(type="scatter", mode="lines",y=~log2,name="scaled",visible=F)
fig <- fig %>% layout(xaxis=list(title="Date"))
fig <- fig %>% layout(yaxis=list(title="Price"))
fig <- fig %>% layout(updatemenus=u)
fig <- fig %>% layout(title="dollar")
fig
