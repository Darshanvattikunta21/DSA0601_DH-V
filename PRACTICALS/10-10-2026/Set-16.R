# Set 16: Customer Demographics Analysis
customers <- data.frame(id = 1:3, age = c(28, 35, 42), gender = c("Female", "Male", "Female"), income = c(50000, 60000, 75000))
old <- par(mfrow = c(1, 2), mar = c(5, 4, 3, 1))
barplot(customers$age, names.arg = customers$id, xlab = "Customer ID", ylab = "Age", main = "Customer Ages", col = "steelblue")
pie(table(customers$gender), main = "Customers by Gender", col = c("orchid", "skyblue"))
par(old)
print(customers)
