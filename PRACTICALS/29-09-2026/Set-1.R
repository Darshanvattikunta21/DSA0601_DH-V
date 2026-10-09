# Set 1: Monthly Sales Analysis
months <- factor(c("January", "February", "March", "April", "May"), levels = c("January", "February", "March", "April", "May"))
monthly_sales <- data.frame(month = months, sales = c(15000, 18000, 22000, 20000, 23000))
# Product totals and advertising budgets are sample values because the prompt gives no raw data for them.
products <- data.frame(product = c("A", "B", "C", "D"), sales = c(42000, 36500, 28900, 21400))
advertising <- data.frame(budget = c(2, 3, 4, 5, 6), sales = c(15000, 18000, 22000, 20000, 23000))

old <- par(mfrow = c(1, 3), mar = c(5, 4, 3, 1))
plot(monthly_sales$sales, type = "o", xaxt = "n", xlab = "Month", ylab = "Sales ($)", main = "Monthly Sales", col = "steelblue", lwd = 2)
axis(1, at = seq_along(months), labels = months)
barplot(products$sales, names.arg = products$product, xlab = "Product", ylab = "Sales ($)", main = "Annual Sales by Product", col = "darkseagreen3")
plot(advertising$budget, advertising$sales, pch = 19, xlab = "Advertising budget ($ thousands)", ylab = "Monthly sales ($)", main = "Advertising vs Sales", col = "tomato")
abline(lm(sales ~ budget, data = advertising), col = "steelblue", lwd = 2)
par(old)
cat("Sample-data insight: the supplied monthly sales generally rise; the sample advertising data show a positive association, not proof of causation.\n")
