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
#Plot 2
#
png(filename = "plot2.png", width = 480, height = 480)
plot(datasub$datetime,datasub$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()


