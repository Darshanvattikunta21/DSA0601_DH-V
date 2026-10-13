# Set 19: Survey Responses Analysis
survey <- data.frame(
  `Survey ID` = c(1, 2, 3, 1),
  `Question 1` = c("A", "B", "C", "B"),
  `Question 2` = c("B", "A", "A", "A"),
  `Question 3` = c("C", "D", "B", "C"),
  check.names = FALSE
)

answers <- c("A", "B", "C", "D")
q1_counts <- xtabs(
  ~ factor(`Question 1`, levels = answers) + factor(`Survey ID`),
  data = survey
)
response_data <- data.frame(
  Question = rep(paste("Question", 1:3), each = nrow(survey)),
  Answer = c(survey$`Question 1`, survey$`Question 2`, survey$`Question 3`)
)
response_counts <- xtabs(
  ~ factor(Answer, levels = answers) + Question,
  data = response_data
)

old <- par(mfrow = c(1, 3), mar = c(6, 4, 4, 1))
barplot(
  q1_counts, beside = TRUE, names.arg = colnames(q1_counts),
  xlab = "Survey ID", ylab = "Number of responses",
  main = "Question 1 Answers by Survey",
  col = c("steelblue", "tomato", "gold", "darkseagreen3"),
  legend.text = rownames(q1_counts), args.legend = list(title = "Answer")
)
barplot(
  response_counts, names.arg = colnames(response_counts),
  xlab = "Question", ylab = "Number of responses",
  main = "Response Distribution by Question",
  col = c("steelblue", "tomato", "gold", "darkseagreen3"),
  legend.text = rownames(response_counts), args.legend = list(title = "Answer")
)
plot.new()
title("Survey Response Table")
text(
  0.03, 0.95,
  paste(capture.output(print(survey, row.names = FALSE)), collapse = "\n"),
  adj = c(0, 1), family = "mono", cex = 0.75
)
par(old)

cat(
  "Tableau dashboard: connect to the survey data, create a grouped bar sheet ",
  "(Survey ID and Question 1 answer counts), a stacked bar sheet ",
  "(Question and Answer counts), and a response table. Combine the sheets ",
  "on a dashboard and show a Survey ID filter.\n",
  sep = ""
)
