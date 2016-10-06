# Read Advertising Data set from /data
dat <- read.csv('data/Advertising.csv', row.names = 1)

# Compute summary statistics and write to eda-output.txt
sink("data/eda-output.txt")
summary(dat)
sink()


# Compute histograms for Sales and TV and write to png/pdf formats
pdf("images/histogram-tv.pdf")
hist(dat$TV, main = "TV Histogram", xlab = "Dollars spent", col = "light blue", border = "white")
dev.off()
pdf("images/histogram-sales.pdf")
hist(dat$Sales, main = "Sales Histogram", xlab = "Dollars spent", col = "lavender", border = "white")
dev.off()
png("images/histogram-tv.png", width=240, height=240)
hist(dat$TV, main = "TV Histogram", xlab = "Dollars spent", col = "light blue", border = "white")
dev.off()
png("images/histogram-sales.png", width=240, height=240)
hist(dat$Sales, main = "Sales Histogram", xlab = "Dollars spent", col = "lavender", border = "white")
dev.off()
