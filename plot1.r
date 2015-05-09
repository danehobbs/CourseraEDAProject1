#Plot 1
#Connect to the source data.  Store to temp file.
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
headerlabels <- c("date", "time", "global_active_power", "global_reactive_power", "voltage", "global_intensity", "sub_metering_1", "sub_metering_2", "sub_metering_3")
temp <- tempfile()
download.file(url,temp)
#Extract the rows needed for the assignment (done by brute force, changing the nrows and skip)
data <- read.csv(unzip(temp, unzip(temp, list = TRUE)[1,1]), sep = ";", nrows=2880, skip = 66636, col.names = headerlabels)
unlink(temp)
#Start the Plot portion of the assignment. Changing dates was not necessary for this plot.
png(file = "plot1.png")
with(data, hist(global_active_power
        ,main = "Global Active Power"
        ,xlab = "Global Active Power (kilowatts)"
        ,ylab = "Frequency"
        ,col = "red"))
dev.off()
