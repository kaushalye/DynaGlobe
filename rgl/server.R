options(rgl.useNULL=TRUE)

library(shiny)
library(shinyRGL)
library(rgl)

source('helpers.R')

#data = read.csv('../data/au.csv')
data = read.csv('../GVP_Volcano_List.csv')

radius = 6371
points = latlong2cart(data, radius)
color1 = makeColors(data$Elevation)
color2 = interleave(color1, color1)

shinyServer(function(input, output) {
  output$webgl = renderWebGL({
    rgl.open()
    rgl.lines(points, color=color2, lwd=2, line_antialias=TRUE)
    rgl.spheres(0, 0, 0, radius=radius, specular='#202020')
  })
})

