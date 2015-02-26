latlong2cart = function (coordinates) {
  R = 6371 # radius of earth in km
  coordinates$x = R * cos(coordinates$latitude/180*pi) * cos(coordinates$longitude/180*pi)
  coordinates$y = R * cos(coordinates$latitude/180*pi) * sin(coordinates$longitude/180*pi)
  coordinates$z = R * sin(coordinates$latitude/180*pi)
  return(coordinates)
}

postcodes = read.csv('../data/au.csv')
#postcodes = postcodes[c(1:10),]
postcodes = latlong2cart(postcodes)

open3d()
points3d(postcodes$x, postcodes$y, postcodes$z)
