# Set 12: Website Traffic
traffic <- data.frame(date = as.Date(c("2023-01-01", "2023-01-02", "2023-01-03")), views = c(1500, 1600, 1400), ctr = c(2.3, 2.7, 2.0))
rank <- order(traffic$ctr, decreasing = TRUE)
old <- par(mfrow = c(1, 3), mar = c(5, 4, 3, 1))
plot(traffic$date, traffic$views, type = "o", xlab = "Date", ylab = "Page views", main = "Daily Page Views", col = "steelblue")
barplot(traffic$ctr[rank], names.arg = format(traffic$date[rank], "%b %d"), ylab = "Click-through rate (%)", main = "CTR by Day", col = "darkseagreen3")
plot.new(); title("Traffic Data Table")
text(.05, .9, paste(capture.output(print(traffic, row.names = FALSE)), collapse = "\n"), adj = c(0, 1), family = "mono", cex = .65)
par(old)
