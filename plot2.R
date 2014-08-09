df <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
df$Date<-as.Date(df$Date, format="%d/%m/%Y")
ss <- df[((df$Date=="2007-02-01") | (df$Date=="2007-02-02")), ]
ss$DateTime <- paste(ss[, "Date"], ss[, "Time"], sep=" ")
ss$DateTime <- strptime(ss$DateTime, format="%F %T")

png(file="plot2.png")
plot(ss$DateTime, ss$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l")
dev.off()
