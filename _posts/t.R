library(ggplot2)

set.seed(123)
df <- data.frame(x = rnorm(1000, mean = 5))
ggplot(df, aes(sample = x)) + geom_qq() + geom_qq_line() + theme_bw()
dev.off()
