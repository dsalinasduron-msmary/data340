library(plotly)
library(rjson)

geoj <- fromJSON(file="https://raw.githubusercontent.com/plotly/datasets/master/geojson-counties-fips.json")

df <- read.csv(file="https://raw.githubusercontent.com/plotly/datasets/master/fips-unemp-16.csv", colClasses=c(fips="character"))

fig <- plot_ly()
fig <- fig %>% add_trace(
  type="choropleth",
  geojson=geoj,
  locations=df$fips,
  z=df$unemp
)

g <- list(
  scope = 'usa',
  projection = list(type = 'albers usa')
)
fig <- fig %>% layout(geo=g)
fig