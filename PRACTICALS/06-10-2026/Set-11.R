# Set 11: Product Category Analysis
categories <- data.frame(category = c("Electronics", "Clothing", "Appliances"), sales = c(50000, 35000, 40000))
ordered <- categories[order(categories$sales, decreasing = TRUE), ]
old <- par(mfrow = c(1, 3), mar = c(5, 4, 3, 1))
barplot(ordered$sales, names.arg = ordered$category, horiz = TRUE, las = 1, xlab = "Sales ($)", main = "Sales Funnel by Category", col = c("steelblue", "tomato", "gold"))
pie(categories$sales, labels = paste(categories$category, "\n$", categories$sales), main = "Sales Share by Category", col = c("steelblue", "tomato", "gold"))
plot.new(); title("Category Sales Table")
text(.05, .9, paste(capture.output(print(categories, row.names = FALSE)), collapse = "\n"), adj = c(0, 1), family = "mono", cex = .7)
par(old)
cat("Note: the prompt supplies category totals, not conversion-stage data; the horizontal sorted bars provide a funnel-style category comparison.\n")
