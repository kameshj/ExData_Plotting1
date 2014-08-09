df <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
df$Date<-as.Date(df$Date, format="%d/%m/%Y")
ss <- df[((df$Date=="2007-02-01") | (df$Date=="2007-02-02")), ]

png(file="plot1.png")
hist(ss$Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power")
dev.off()
