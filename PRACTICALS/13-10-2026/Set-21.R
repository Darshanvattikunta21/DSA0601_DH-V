# Set 21: Energy Consumption Analysis
energy <- data.frame(
  Sector = c("Residential", "Commercial", "Industrial", "Residential", "Commercial", "Industrial"),
  Region = c("North", "South", "West", "East", "North", "South"),
  Month = c("Jan", "Jan", "Feb", "Feb", "Mar", "Mar"),
  `Temperature (°C)` = c(15, 24, 20, 18, 28, 30),
  `Units_Consumed (kWh)` = c(320, 540, 880, 350, 610, 920),
  `Cost (₹)` = c(2100, 3600, 5900, 2300, 4100, 6200),
  `Renewable_Usage (%)` = c(22, 18, 12, 25, 20, 15),
  Peak_Hours = c(4, 6, 8, 5, 7, 9),
  check.names = FALSE
)

# Export the supplied data for Tableau if the dataset file is not already present.
if (!file.exists("Energy_Consumption_Data.csv")) {
  write.csv(energy, "Energy_Consumption_Data.csv", row.names = FALSE)
}
energy <- read.csv("Energy_Consumption_Data.csv", check.names = FALSE)
required_columns <- c(
  "Sector", "Region", "Month", "Temperature (°C)", "Units_Consumed (kWh)",
  "Cost (₹)", "Renewable_Usage (%)", "Peak_Hours"
)
if (!all(required_columns %in% names(energy))) {
  stop("Energy_Consumption_Data.csv does not have the expected dataset columns.")
}

old <- par(mfrow = c(1, 3), mar = c(5, 4, 4, 1))
hist(
  energy$`Units_Consumed (kWh)`, probability = TRUE,
  xlab = "Units consumed (kWh)", main = "Energy Consumption Distribution",
  col = "lightblue", border = "white"
)
density_line <- density(energy$`Units_Consumed (kWh)`)
lines(density_line, col = "firebrick", lwd = 2)
legend(
  "topright", c("Histogram", "Density"),
  fill = c("lightblue", NA), border = NA,
  lty = c(NA, 1), col = c(NA, "firebrick"), bty = "n"
)

plot(
  energy$`Temperature (°C)`, energy$`Units_Consumed (kWh)`,
  pch = 21, bg = adjustcolor("steelblue", alpha.f = 0.5),
  cex = energy$Peak_Hours / 3,
  xlab = "Temperature (°C)", ylab = "Units consumed (kWh)",
  main = "Temperature and Energy Use"
)
legend(
  "topleft", "Bubble size represents peak hours",
  pch = 21, pt.bg = adjustcolor("steelblue", alpha.f = 0.5), bty = "n"
)

renewable_average <- aggregate(
  `Renewable_Usage (%)` ~ Sector, data = energy, FUN = mean
)
renewable_average <- renewable_average[
  order(renewable_average$`Renewable_Usage (%)`, decreasing = TRUE), ]
barplot(
  renewable_average$`Renewable_Usage (%)`,
  names.arg = renewable_average$Sector, las = 2,
  xlab = "Sector", ylab = "Average renewable usage (%)",
  main = "Renewable Adoption by Sector", col = "darkseagreen3"
)
par(old)

cat("Average renewable usage by sector (%):\n")
print(renewable_average, row.names = FALSE)
cat(
  "Interpretation: Residential has the highest average renewable usage in ",
  "this sample, while Industrial has the lowest. The dataset is small, so ",
  "these averages describe only the supplied observations.\n",
  "Tableau dashboard: connect to Energy_Consumption_Data.csv. Create a ",
  "monthly Units_Consumed_kWh line chart and a Sector-by-Region heatmap ",
  "colored by Units_Consumed_kWh. Add Month and Sector filters, then place ",
  "both sheets on an interactive dashboard.\n",
  sep = ""
)
