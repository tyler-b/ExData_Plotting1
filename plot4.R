#Project 1

#Get data
#url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#download.file(url,"data.zip",mode="wb")

#Read data
data <- read.table("household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?")
#concatenate the character 'date' and 'time' columns
data$datetime <- paste(data$Date, data$Time, sep="T")
#Convert the datetime column to a date object
data$datetime <- strptime(data$datetime,format = "%d/%m/%YT%H:%M:%S")
#Remove first two col of character 'date' and 'time'
data <- data[,3:10]
#Reorder columns so 'datetime' is first
data <- data[,c(8,1,2,3,4,5,6,7)]
#create subset of the two days of interest
datasub <- data[as.Date(data$datetime) == "2007-02-01" | as.Date(data$datetime) == "2007-02-02",]


#
#Plot 4
#
png(filename = "plot4.png", width = 480, height = 480)
par("mfrow"=c(2,2))
#Panel 1
plot(datasub$datetime,datasub$Global_active_power, type = "l", xlab="", ylab="Global Active Power")
#Panel 2
plot(datasub$datetime,datasub$Voltage, type = "l", xlab="datetime", ylab="Voltage")
#Panel 3
plot(datasub$datetime, datasub$Sub_metering_1,type = "n", xlab = "", ylab = "Energy sub metering")
lines(datasub$datetime, datasub$Sub_metering_1, type = "l", col = "black")
lines(datasub$datetime, datasub$Sub_metering_2, type = "l", col = "red")
lines(datasub$datetime, datasub$Sub_metering_3, type = "l", col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"), pch = "_")
#Panel 4
plot(datasub$datetime,datasub$Global_reactive_power, type = "l", xlab="datetime", ylab="Global_reactive_power")
dev.off()

