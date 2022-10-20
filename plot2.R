##Load Data File##

data_load <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", 
                      stringsAsFactors=FALSE, na.strings = "?", dec=".")

data_load$Date <- as.Date(data_load$Date, format = "%d/%m/%Y")
data_load_subset <-subset(data_load, data_load$Date >= "2007-02-01" & data_load$Date <= "2007-02-02")
data_load_subset$TS <- as.POSIXct(paste(data_load_subset$Date, data_load_subset$Time, seperator = " "))
png("plot2.png", height = 480, width = 480)
plot(data_load_subset$Global_active_power~data_load_subset$TS, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()
