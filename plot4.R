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

png(filename="plot4.png")
par(mfrow=c(2,2))
# make 1st plot
plot(eSub$DateTime, eSub$Global_active_power, type="l", xlab="",
     ylab="Global Active Power")

# make 2nd plot
plot(eSub$DateTime, eSub$Voltage, type="l", xlab="datetime", ylab="Voltage")

# make 3rd plot
with(eSub, plot(DateTime, Sub_metering_1, type="n", xlab="", 
                ylab="Energy sub metering"))
lines(eSub$DateTime, eSub$Sub_metering_1, col="black")
lines(eSub$DateTime, eSub$Sub_metering_2, col="red")
lines(eSub$DateTime, eSub$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, bty="n",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# make 4th plot
plot(eSub$DateTime, eSub$Global_reactive_power, type="l", xlab="datetime", 
     ylab="Global_reactive_power")

dev.off()
