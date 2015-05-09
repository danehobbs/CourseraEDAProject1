#Plot 4
#Connect to the source data.  Store to temp file.
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
headerlabels <- c("date", "time", "global_active_power", "global_reactive_power", "voltage", "global_intensity", "sub_metering_1", "sub_metering_2", "sub_metering_3")
temp <- tempfile()
download.file(url,temp)
#Extract the rows needed for the assignment (done by brute force, changing the nrows and skip)
data <- read.csv(unzip(temp, unzip(temp, list = TRUE)[1,1]), sep = ";", nrows=2880, skip = 66636, col.names = headerlabels)
unlink(temp)
#Change the date and combine with the time column.
data$date <- as.Date(paste(data$date), "%d/%m/%Y")
data$datetime <- strptime(paste(data$date, data$time), "%Y-%m-%d %H:%M:%S", tz="GMT")
#Start the Plot portion of the assignment
png(file = "plot4.png")
par(mfrow=c(2,2))
with(data, plot(datetime,global_active_power
                ,ylab = "Global Active Power (kilowatts)"
                ,xlab = ""
                ,type = "l"))
with(data, plot(datetime,voltage
                ,ylab = "Voltage"
                ,xlab = "datetime"
                ,type = "l"))
with(data, plot(datetime,sub_metering_1
                ,ylab = "Energy sub metering"
                ,xlab = ""
                ,type = "l"))
with(data, lines(datetime,sub_metering_2, col="red"))
with(data, lines(datetime,sub_metering_3, col="blue"))
legend("topright"
       , lty=1, col = c("black", "red", "blue"), bty = "n"
       , legend = c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"))

with(data, plot(datetime,global_reactive_power
                ,ylab = "Global_reactive_power"
                ,xlab = "datetime"
                ,type = "l"))

dev.off()