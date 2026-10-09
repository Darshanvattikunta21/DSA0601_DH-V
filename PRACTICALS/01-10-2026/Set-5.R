# Set 5: Website Analytics
traffic <- data.frame(date = as.Date(sprintf("2023-01-%02d", 1:5)), views = c(1500, 1600, 1400, 1650, 1800), ctr = c(2.3, 2.7, 2.0, 2.4, 2.6))
# Interaction counts are sample values because the prompt provides no likes/shares/comments data.
interactions <- data.frame(date = traffic$date, Likes = c(80, 95, 75, 110, 125), Shares = c(20, 28, 18, 30, 35), Comments = c(12, 15, 10, 18, 22))
old <- par(mfrow = c(1, 3), mar = c(5, 4, 3, 1))
plot(traffic$date, traffic$views, type = "o", xlab = "Date", ylab = "Page views", main = "Daily Page Views", col = "steelblue")
rank <- order(traffic$ctr, decreasing = TRUE)[1:3]
barplot(traffic$ctr[rank], names.arg = format(traffic$date[rank], "%b %d"), ylab = "Click-through rate (%)", main = "Top 3 CTR Days", col = "darkseagreen3")
matplot(interactions$date, interactions[-1], type = "l", lty = 1, lwd = 2, xlab = "Date", ylab = "Interactions", main = "User Interactions", col = c("tomato", "steelblue", "goldenrod"))
legend("topleft", colnames(interactions)[-1], col = c("tomato", "steelblue", "goldenrod"), lty = 1, bty = "n")
par(old)
print(traffic)
