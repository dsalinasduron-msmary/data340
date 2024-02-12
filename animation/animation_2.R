library(plotly)
library(rjson)

g <- fromJSON(file="https://raw.githubusercontent.com/plotly/datasets/master/geojson-counties-fips.json")
df <- read.csv(file="https://raw.githubusercontent.com/plotly/datasets/master/fips-unemp-16.csv",header=T, colClasses=c("fips"="character"))

df$frame <- rep(1,nrow(df))

# make second dataframe for frame number 2
df2 <- data.frame(df)
df2$frame <- rep(2,nrow(df2))
df2$unemp <- df$unemp * 2

mega_df <- rbind(df,df2)

fig <- plot_ly(data=mega_df,frame=~frame)
fig <- fig %>% add_trace(type="choropleth",
                 geojson=g,
                 locations=~fips,
                 z=~unemp,
                 zmin=min(mega_df$unemp),
                 zmax=max(mega_df$unemp))
fig
