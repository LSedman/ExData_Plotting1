# set working directory to the one that includes required data
# setwd("/home/lsedman/Documents/Learn/Online courses/DataScience/Exploratory data analysis/week1/courseProject1/")

# read in data and subset to data collected on Feb 1 and 2, 2007.
e <- read.table(file="household_power_consumption.txt", header=T, sep=";", 
                stringsAsFactors=F)
selected <- c("1/2/2007", "2/2/2007")
eSub <- e[e$Date %in% selected,]

# reformat date and time
eSub$DateTime <- paste(eSub$Date, eSub$Time, sep=" ")
eSub$DateTime <- strptime(eSub$DateTime, "%d/%m/%Y %H:%M:%S")

# make plot
png(filename="plot2.png")
plot(eSub$DateTime, eSub$Global_active_power, type="l", xlab="",
     ylab="Global Active Power (kilowatts)")
dev.off()
