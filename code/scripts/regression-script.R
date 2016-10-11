# Read data
dat <- read.csv('data/Advertising.csv', row.names = 1)

# Compute regression
fit <- lm(Sales ~ ., data = dat)
summ <- summary(fit)
save(fit, summ, file="data/regression.Rdata")

# scatterplot and fit line
png("images/scatterplot-tv-sales.png", width=240, height=240)
plot(Sales ~ TV, data= dat, main= "Regression of TV on Sales", col="light blue")
abline(lm(Sales~TV, data = dat), col="blue")
dev.off()
png("images/scatterplot-radio-sales.png", width=240, height=240)
plot(Sales ~ Radio, data= dat, main= "Regression of Radio on Sales", col="light blue")
abline(lm(Sales~Radio, data = dat), col="blue")
dev.off()
png("images/scatterplot-newspaper-sales.png", width=240, height=240)
plot(Sales ~ Newspaper, data= dat, main= "Regression of Newspaper on Sales", col="light blue")
abline(lm(Sales~Newspaper, data = dat), col="blue")
dev.off()

png("images/residual-plot.png", width=240, height=240)
plot(fit, which = c(1), col="light blue")
dev.off()
png("images/scale-location-plot.png", width=240, height=240)
plot(fit, which = c(3), col="light blue")
dev.off()
png("images/normal-qq-plot.png", width=240, height=240)
plot(fit, which = c(2), col="light blue")
dev.off()

