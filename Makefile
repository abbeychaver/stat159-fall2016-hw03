
all: eda-output.txt regression.Rdata report.pdf

data: 
	curl -O http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv

clean:
	rm report/report.pdf

report.pdf:
	pandoc -o report/report.pdf report/report.Rmd

regression.Rdata: code/regression-script.R data/Advertising.csv
	Rscript code/regression-script.R

eda-output.txt: code/eda-script.R data/Advertising.csv
	Rscript code/eda-script.R