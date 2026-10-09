# Set 17: Employee Performance Analysis
employees <- data.frame(id = 1:3, department = c("Sales", "HR", "Marketing"), years = c(5, 3, 7), score = c(85, 92, 78))
ordered <- employees[order(employees$years), ]
old <- par(mfrow = c(1, 3), mar = c(5, 4, 3, 1))
plot(ordered$years, ordered$score, type = "b", pch = 19, xlab = "Years of service (ordered proxy)", ylab = "Performance score", main = "Score by Service", col = "steelblue")
barplot(table(employees$department), las = 2, xlab = "Department", ylab = "Employees", main = "Department Counts", col = "darkseagreen3")
plot.new(); title("Employee Performance Table")
text(.05, .9, paste(capture.output(print(employees, row.names = FALSE)), collapse = "\n"), adj = c(0, 1), family = "mono", cex = .65)
par(old)
cat("The dataset has no time variable; years of service are used as an ordering proxy rather than a true time trend.\n")
