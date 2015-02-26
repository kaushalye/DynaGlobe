library(rgl)

latlong2cart = function (coordinates) {
  R = 6371 # radius of earth in km
  coordinates$x = R * cos(coordinates$Latitude/180*pi) * cos(coordinates$Longitude/180*pi)
  coordinates$y = R * cos(coordinates$Latitude/180*pi) * sin(coordinates$Longitude/180*pi)
  coordinates$z = R * sin(coordinates$Latitude/180*pi)
  return(coordinates)
}

#data = read.csv('../data/au.csv')
data = read.csv('../GVP_Volcano_List.csv')

data = latlong2cart(data)

open3d()
points3d(data$x, data$y, data$z)
