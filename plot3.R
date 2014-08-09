df <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
df$Date<-as.Date(df$Date, format="%d/%m/%Y")
ss <- df[((df$Date=="2007-02-01") | (df$Date=="2007-02-02")), ]
ss$DateTime <- paste(ss[, "Date"], ss[, "Time"], sep=" ")
ss$DateTime <- strptime(ss$DateTime, format="%F %T")

png(file="plot3.png")
plot(ss$DateTime, ss$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(ss$DateTime, ss$Sub_metering_2, type="l", xlab="", ylab="Energy sub metering", col="red")
lines(ss$DateTime, ss$Sub_metering_3, type="l", xlab="", ylab="Energy sub metering", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty="solid", col=c("black", "red", "blue"))
dev.off()
