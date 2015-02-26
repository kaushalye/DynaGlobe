library(rgl)

interleave <- function(v1,v2)
{
  ord1 <- 2*(1:length(v1))-1
  ord2 <- 2*(1:length(v2))
  c(v1,v2)[order(c(ord1,ord2))]
}

latlong2cart = function (data, R=6371) {
  x1 = R * cos(data$Latitude/180*pi) * cos(data$Longitude/180*pi)
  y1 = R * cos(data$Latitude/180*pi) * sin(data$Longitude/180*pi)
  z1 = R * sin(data$Latitude/180*pi)

  height = data$Elevation

  x2 = (R + height) * cos(data$Latitude/180*pi) * cos(data$Longitude/180*pi)
  y2 = (R + height) * cos(data$Latitude/180*pi) * sin(data$Longitude/180*pi)
  z2 = (R + height) * sin(data$Latitude/180*pi)

  coordinates = xyz.coords(interleave(x1, x2), interleave(y1, y2), interleave(z1, z2))
  return(coordinates)
}

makeColors = function(values) {
  values = values - min(values) + 1
  values = values / max(values)
  return (gray(values))
}

#data = read.csv('../data/au.csv')
data = read.csv('../GVP_Volcano_List.csv')
#data = data[c(1:10),]

points = latlong2cart(data)

rgl.open()
color = makeColors(data$Elevation)
rgl.lines(points, color = interleave(color, color), lwd=2, line_antialias=TRUE)
rgl.spheres(0,0,0,texture="../Earth.png")
