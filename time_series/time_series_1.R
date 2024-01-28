library(tidyquant)
library(plotly)

getSymbols("AAPL", from="2020-1-1", to="2020-12-31")
getSymbols("GOOG", from="2020-1-1", to="2020-12-31")

df_G <- data.frame(GOOG)
df_A <- data.frame(AAPL)

df <- data.frame(df_G$GOOG.Open,df_A$AAPL.Open)
df$date <- as.Date(rownames(df_G))
colnames(df) <- c("Google","Apple","Date")

fig <- plot_ly(type="scatter", mode="lines")
fig <- fig %>% add_trace(data=df,x=~Date,y=~Google,name="Google")
fig <- fig %>% add_trace(data=df,x=~Date,y=~Apple,name="Apple")

fig <- fig %>% layout(title = 'Google v Apple', yaxis = list(title = 'Opening Price'))

fig
