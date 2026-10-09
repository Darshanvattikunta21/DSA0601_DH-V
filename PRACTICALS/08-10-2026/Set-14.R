# Set 14: Survey Results
responses <- data.frame(id = 1:3, Q1 = c("A", "B", "C"), Q2 = c("B", "A", "A"), Q3 = c("C", "D", "B"))
questions <- responses[c("Q1", "Q2", "Q3")]
counts <- sapply(questions, function(x) table(factor(x, levels = LETTERS[1:4])))
old <- par(mfrow = c(1, 3), mar = c(5, 4, 3, 1))
barplot(counts[, "Q1"], xlab = "Answer", ylab = "Respondents", main = "Question 1 Answers", col = "steelblue")
# Radar-style plot of mean ordinal answer codes (A=1 through D=4).
means <- sapply(questions, function(x) mean(match(x, LETTERS[1:4])))
angles <- seq(0, 2 * pi, length.out = length(means) + 1)[-length(means) - 1]
coords <- cbind(means * cos(angles), means * sin(angles))
plot(coords, type = "n", asp = 1, xlim = c(-4, 4), ylim = c(-4, 4), axes = FALSE, xlab = "", ylab = "", main = "Radar: Mean Answer Code")
polygon(coords, col = adjustcolor("skyblue", .5), border = "steelblue", lwd = 2)
points(coords, pch = 19, col = "steelblue")
text(1.3 * coords, labels = names(means))
plot.new(); title("Survey Response Table")
text(.05, .9, paste(capture.output(print(responses, row.names = FALSE)), collapse = "\n"), adj = c(0, 1), family = "mono", cex = .65)
par(old)
cat("Radar chart treats answer choices as ordinal codes A=1 to D=4; this is a visualization convention, not an inherent numeric scale.\n")
