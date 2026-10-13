# Set 20: Stock Analysis
stocks <- data.frame(
  Date = as.Date(c("2023-01-01", "2023-01-02", "2023-01-03")),
  `Stock A` = c(100, 105, 110),
  `Stock B` = c(150, 152, 148),
  `Stock C` = c(120, 118, 122),
  check.names = FALSE
)
stock_colors <- c("steelblue", "tomato", "darkseagreen3")
stock_a_change <- c(
  NA_real_,
  diff(stocks$`Stock A`) / head(stocks$`Stock A`, -1) * 100
)

old <- par(mfrow = c(1, 3), mar = c(6, 4, 4, 1))
matplot(
  stocks$Date, as.matrix(stocks[c("Stock A", "Stock B", "Stock C")]),
  type = "b", pch = 19, lty = 1, col = stock_colors,
  xlab = "Date", ylab = "Stock price",
  main = "Stock Prices Over Time", xaxt = "n"
)
axis(1, at = stocks$Date, labels = format(stocks$Date, "%Y-%m-%d"), las = 2)
legend("topleft", names(stocks)[2:4], col = stock_colors, lty = 1, pch = 19, bty = "n")

barplot(
  stock_a_change[-1],
  names.arg = format(stocks$Date[-1], "%Y-%m-%d"),
  xlab = "Date", ylab = "Daily percentage change (%)",
  main = "Stock A Daily Change", col = "steelblue"
)
abline(h = 0, col = "gray40", lty = 2)

plot.new()
title("Stock Price Data Table")
text(
  0.03, 0.95,
  paste(capture.output(print(stocks, row.names = FALSE)), collapse = "\n"),
  adj = c(0, 1), family = "mono", cex = 0.75
)
par(old)

cat(
  "Stock A percentage changes are calculated against the previous day's ",
  "closing price; the first date has no prior observation and is omitted ",
  "from the bar chart.\n",
  "Tableau dashboard: create a date-based line sheet for all three stocks, ",
  "a Stock A daily percentage-change bar sheet, and a price table. Combine ",
  "them on a dashboard and add a Date filter.\n",
  sep = ""
)
