library(ggplot2)

data <- read.table("results/msmc2_output.txt", header=TRUE)

colnames(data) <- c("time", "left", "right", "lambda")

data$Ne <- 1 / (2 * data$lambda)

ggplot(data, aes(x = left, y = Ne)) +
  geom_line(color = "blue") +
  scale_x_log10() +
  scale_y_log10() +
  theme_minimal() +
  labs(
    title = "Effective Population Size Over Time",
    x = "Time",
    y = "Ne"
  )

ggsave("plots/msmc2_plot.png")
