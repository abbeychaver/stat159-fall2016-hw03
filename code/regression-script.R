# Read data
dat <- read.csv('data/Advertising.csv', row.names = 1)

# Compute regression
fit <- lm(Sales ~ TV, data = dat)
summ <- summary(fit)
save.image("data/regression.Rdata")

# scatterplot and fit line
png("images/scatterplot-tv-sales.png", width=240, height=240)
plot(Sales ~ TV, data= dat, main= "Regression of TV on Sales", col="lavender")
abline(fit, col="blue")
dev.off()
pdf("images/scatterplot-tv-sales.pdf")
plot(Sales ~ TV, data= dat, main= "Regression of TV on Sales", col="lavender")
abline(fit, col="blue")
dev.off()

