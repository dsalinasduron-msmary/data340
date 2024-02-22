library(plotly)
library(rjson)

# add a button to a choropleth
g <- fromJSON(file="https://raw.githubusercontent.com/plotly/datasets/master/geojson-counties-fips.json")
df <- read.csv("https://raw.githubusercontent.com/plotly/datasets/master/fips-unemp-16.csv", header = T, colClasses = c("fips"="character"))


button_jet = list(
  method="restyle",
  args=list("colorscale","Jet")
)
button_viridis = list(
  method="restyle",
  args=list("colorscale","Viridis")
)

the_buttons = list(type="buttons",buttons=list(button_jet,button_viridis))
u = list(the_buttons)

fig <- plot_ly(data=df)
fig <- fig %>% add_trace(type="choropleth",
                         z = df$unemp,
                         locations=df$fips,
                         geojson=g,
                         colorscale="Viridis")
fig <- fig %>% layout(updatemenus=u)
fig
