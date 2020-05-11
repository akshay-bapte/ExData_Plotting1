full_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")
data2use <- subset(full_data, Date %in% c("1/2/2007","2/2/2007"))
data2use$Date <- as.Date(data2use$Date, format="%d/%m/%Y")
hist(data2use$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
png("plot1.png", width=480, height=480)
dev.off()