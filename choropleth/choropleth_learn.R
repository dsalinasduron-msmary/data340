library(plotly)
library(rjson)

geoj = fromJSON(file="https://raw.githubusercontent.com/dsalinasduron-msmary/data340/main/bigone.json")

fig <- plot_ly()
fig <- fig %>% add_trace(geojson=geoj,locations=1:648,z=runif(648),type="choropleth")

fig
