# Set 13: Geographic Data
# Approximate coordinates are illustrative because city names in the prompt are anonymized.
places <- data.frame(city = c("City A", "City B", "City C"), population = c(500000, 700000, 600000), temperature = c(75, 68, 80), elevation = c(1000, 800, 1200), longitude = c(-118.2, -117.2, -119.0), latitude = c(34.1, 33.8, 35.0))
old <- par(mfrow = c(1, 3), mar = c(5, 4, 3, 1))
plot(places$longitude, places$latitude, pch = 21, bg = "tomato", cex = 1 + places$population / 300000, xlab = "Longitude", ylab = "Latitude", main = "City Locations", asp = 1)
text(places$longitude, places$latitude, labels = places$city, pos = 3)
plot(places$temperature, places$population, pch = 19, xlab = "Average temperature", ylab = "Population", main = "Temperature vs Population", col = "steelblue")
text(places$temperature, places$population, labels = places$city, pos = 3)
plot.new(); title("Geographic Data Table")
text(.05, .9, paste(capture.output(print(places[1:4], row.names = FALSE)), collapse = "\n"), adj = c(0, 1), family = "mono", cex = .65)
par(old)
cat("Insight: three anonymized observations are insufficient to infer a reliable temperature-population relationship. Coordinates are illustrative, not supplied locations.\n")
