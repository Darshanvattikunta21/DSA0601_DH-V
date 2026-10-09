# Set 6: Product Sales Analysis
sales <- data.frame(product = c("A", "B", "C"), January = c(2000, 1500, 1200), February = c(2200, 1800, 1400), March = c(2400, 1600, 1100))
monthly <- as.matrix(sales[c("January", "February", "March")]); rownames(monthly) <- sales$product
old <- par(mfrow = c(1, 2), mar = c(5, 4, 3, 1))
barplot(monthly, beside = TRUE, xlab = "Month", ylab = "Sales ($)", main = "Quarterly Sales by Product", col = c("steelblue", "tomato", "gold"), legend.text = rownames(monthly))
plot(1:3, colSums(monthly), type = "n", xaxt = "n", xlab = "Month", ylab = "Sales ($)", main = "Stacked Monthly Sales")
axis(1, 1:3, colnames(monthly))
colors <- c("steelblue", "tomato", "gold"); lower <- rep(0, 3)
for (i in seq_len(nrow(monthly))) { upper <- lower + monthly[i, ]; polygon(c(1:3, 3:1), c(upper, rev(lower)), col = colors[i], border = NA); lower <- upper }
legend("topleft", rownames(monthly), fill = colors, bty = "n")
par(old)
print(sales)
