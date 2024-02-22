library(plotly)
library(rjson)

g <- fromJSON(file="https://raw.githubusercontent.com/plotly/datasets/master/geojson-counties-fips.json")
d <- read.csv("https://raw.githubusercontent.com/plotly/datasets/master/fips-unemp-16.csv", header = T, colClasses = c("fips"="character"))


fig <- plot_ly()
fig <- fig %>% add_trace(type="choropleth",
                         geojson=g,
                         z=d$unemp,
                         locations=d$fips)

a1 <- c("colorscale","Jet")
a2 <- c("colorscale","Viridis")
button_jet <- list(method="restyle",args=a1,label="let's go jets!")
button_vir <- list(method="restyle",args=a2,label="bring viridis back!")
button_list <- list(type="buttons", buttons=list(button_jet,button_vir) )
u <- list( button_list )
fig <- fig %>% layout(updatemenus=u)
geo <- list(visible=F,scope="usa",
            projection="albers usa")
fig <- fig %>% layout(geo=geo)
fig
