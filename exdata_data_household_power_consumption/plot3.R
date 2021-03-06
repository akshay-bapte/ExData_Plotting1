full_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")
data2use <- subset(full_data, Date %in% c("1/2/2007","2/2/2007"))
data2use$Date <- as.Date(data2use$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data2use$Date), data2use$Time)
data2use$Datetime <- as.POSIXct(datetime)
with(data2use, {
     plot(Sub_metering_1~Datetime, type="l",
             +          ylab="Global Active Power (kilowatts)", xlab="")
       lines(Sub_metering_2~Datetime,col='Red')
       lines(Sub_metering_3~Datetime,col='Blue')
   })
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
                 legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
