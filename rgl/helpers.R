interleave <- function(v1,v2)
{
  ord1 <- 2*(1:length(v1))-1
  ord2 <- 2*(1:length(v2))
  c(v1,v2)[order(c(ord1,ord2))]
}

latlong2cart = function (data, R=6371) {
  x = -cos(data$Latitude/180*pi) * sin(data$Longitude/180*pi)
  z = -cos(data$Latitude/180*pi) * cos(data$Longitude/180*pi)
  y = sin(data$Latitude/180*pi)
  height = data$Elevation/5 # exaggerate height by 200x
  coordinates = xyz.coords(interleave(x*R, x*(R+height)),
                           interleave(y*R, y*(R+height)),
                           interleave(z*R, z*(R+height)))
  return(coordinates)
}

makeColors = function(values) {
  values = values - min(values) + 1
  values = values / max(values)
  return (gray(values))
}
