full_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")
data2use <- subset(full_data, Date %in% c("1/2/2007","2/2/2007"))
data2use$Date <- as.Date(data2use$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data2use$Date), data2use$Time)
data2use$Datetime <- as.POSIXct(datetime)
par(mfrow=c(2,2))
with(data2use, {
       plot(Global_active_power~Datetime, type="l", 
                       ylab="Global Active Power (kilowatts)", xlab="")
       plot(Voltage~Datetime, type="l", 
                       ylab="Voltage (volt)", xlab="datetime")
       plot(Sub_metering_1~Datetime, type="l", 
                       ylab="Global Active Power (kilowatts)", xlab="")
       lines(Sub_metering_2~Datetime,col='Red')
       lines(Sub_metering_3~Datetime,col='Blue')
       legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.5)
       plot(Global_reactive_power~Datetime, type="l", 
                      ylab="Global Rective Power (kilowatts)",xlab="datetime")
   })
dev.copy(png, file="plot4.png")
dev.off()
