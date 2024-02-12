library(plotly)
library(rjson)

g <- fromJSON(file="https://raw.githubusercontent.com/plotly/datasets/master/geojson-counties-fips.json")
u <- read.csv("https://raw.githubusercontent.com/plotly/datasets/master/fips-unemp-16.csv", header = T, colClasses = c("fips"="character"))
u$f <- rep(1,nrow(u))
u2 <- data.frame(u)
u2$f <- rep(2,nrow(u2))
u2$unemp <- u2$unemp * 2

ux <- rbind(u,u2)

fig <- plot_ly(data=ux,frame=~f)
fig <- fig %>% add_trace(type="choropleth",
                         geojson=g,
                         z=~unemp,
                         locations=~fips,
                         zmin=min(ux$unemp),zmax=max(ux$unemp))
fig
