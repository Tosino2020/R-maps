
library(ggmap)

paris <- get_map(location = "paris")
ggmap(paris)

geocode("india gate")
geocode("baylor university",output="latlona")
geocode("baylor university",output="more")
geocode("baylor university",output="all")
geocodeQueryCheck()


map<-get_map(location=c(lon=77.2295,lat=28.61291),maptype="roadmap",source="google")
ggmap(map)

###Houston crime data
str(crime)
qmap("Houston",zoom=14)
gglocator(2)

###subset violent crimes
violent_crimes <- subset(crime,offense != "auto theft" & offense != "theft" & offense != "burglary")

###factor crimes
violent_crimes$offense<-factor(violent_crimes$offense,level=c("robbery","aggravated assault", "rape", "murder"))

###restrict to downtown
violent_crimes<-subset(violent_crimes,-95.39681 <= lon & lon <= -95.34188 &  29.73631 <= lat & lat <= 29.78400)

theme_set(theme_bw(16))
HoustonMap <- qmap("houston", zoom = 14, color = "bw", legend = "topleft")

HoustonMap +
  geom_point(aes(x = lon, y = lat, colour = offense, size = offense),
             data = violent_crimes)
HoustonMap +
  stat_bin2d(
    aes(x = lon, y = lat, colour = offense, fill = offense),
    size = .5, bins = 30, alpha = 1/2,
    data = violent_crimes
  )


###


