# Read Advertising Data set from /data
dat <- read.csv('data/Advertising.csv', row.names = 1)

# Compute summary statistics and write to eda-output.txt
sink("data/eda-output.txt")
summary(dat)
corr <- cor(dat)
sink()
save(corr, file = "data/correlation_matrix.Rdata")

# Compute histograms for all variables and write to png formats
png("images/histogram-tv.png", width=240, height=240)
hist(dat$TV, main = "TV Histogram", xlab = "Dollars spent", col = "light blue", border = "white")
dev.off()
png("images/histogram-sales.png", width=300, height=240)
hist(dat$Sales, main = "Sales Histogram", xlab = "Dollars spent", col = "lavender", border = "white")
dev.off()
png("images/histogram-radio.png", width=300, height=240)
hist(dat$Radio, main = "Radio Histogram", xlab = "Dollars spent", col = "light green", border = "white")
dev.off()
png("images/histogram-newspaper.png", width=300, height=240)
hist(dat$Newspaper, main = "Newspaper Histogram", xlab = "Dollars spent", col = "light pink", border = "white")
dev.off()
png("images/scatterplot-matrix.png", width=300, height=300)
plot(dat)
dev.off()

