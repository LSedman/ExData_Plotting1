# set working directory to the one that includes required data
# setwd("/home/lsedman/Documents/Learn/Online courses/DataScience/Exploratory data analysis/week1/courseProject1/")

# read in data and subset to data collected on Feb 1 and 2, 2007.
e <- read.table(file="household_power_consumption.txt", header=T, sep=";", 
                stringsAsFactors=F)
selected <- c("1/2/2007", "2/2/2007")
eSub <- e[e$Date %in% selected,]

# prepare plot 1
png(filename="plot1.png")
hist(as.numeric(eSub$Global_active_power), col="red",
     xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()
