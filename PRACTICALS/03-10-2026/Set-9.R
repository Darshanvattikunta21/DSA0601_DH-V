# Set 9: Online Learning Activity
if (file.exists("Online_Learning_Activity.csv")) {
  learning <- read.csv("Online_Learning_Activity.csv", stringsAsFactors = FALSE)
} else {
  learning <- data.frame(Student_ID = c("L01", "L02", "L03", "L04", "L05", "L06"), Gender = c("Male", "Female", "Male", "Female", "Male", "Female"), Age = c(20, 22, 19, 21, 23, 20), Course = c("R", "R", "SQL", "R", "R", "SQL"), Study_Time = c(3.5, 4.2, 2, 5, 2.5, 4), Videos_Watched = c(12, 15, 8, 18, 9, 14), Quiz_Score = c(78, 85, 65, 92, 70, 88), Login_Date = c("2025-01-05", "2025-01-05", "2025-02-08", "2025-02-08", "2025-03-12", "2025-03-12"))
}
learning$Login_Date <- as.Date(learning$Login_Date)
old <- par(mfrow = c(2, 2), mar = c(5, 4, 3, 1))
hist(learning$Quiz_Score, xlab = "Quiz score", main = "Quiz Score Distribution", col = "skyblue")
boxplot(Quiz_Score ~ Course, data = learning, xlab = "Course", ylab = "Quiz score", main = "Scores by Course", col = "darkseagreen3")
plot(learning$Study_Time, learning$Quiz_Score, pch = 21, bg = adjustcolor("tomato", .5), cex = 1 + 2 * learning$Videos_Watched / max(learning$Videos_Watched), xlab = "Study time (hours)", ylab = "Quiz score", main = "Study Time vs Score")
legend("topleft", "Bubble size = videos watched", bty = "n")
month <- format(learning$Login_Date, "%Y-%m")
monthly <- aggregate(Quiz_Score ~ month, learning, mean)
monthly$moving_avg <- as.numeric(stats::filter(monthly$Quiz_Score, rep(1 / 3, 3), sides = 2))
plot(seq_len(nrow(monthly)), monthly$Quiz_Score, type = "o", xaxt = "n", xlab = "Month", ylab = "Average quiz score", main = "Monthly Average Score", col = "steelblue")
axis(1, seq_len(nrow(monthly)), monthly$month)
lines(seq_len(nrow(monthly)), monthly$moving_avg, type = "o", col = "tomato", lty = 2)
legend("topleft", c("Average", "3-month moving average"), col = c("steelblue", "tomato"), lty = c(1, 2), bty = "n")
par(old)
cat("Interpretation: scores tend to be higher for students reporting more study time in this small sample; the sample is too small for a strong general conclusion.\n")
print(monthly)
