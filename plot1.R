##laoding data##
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
data$date  <- as.Date(data$Date, "%d/%m/%Y")
data_subset <- subset(data,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
data <- data[complete.cases(data),]
dateTime <- paste(data$Date, data$Time)
data<- data[ ,!(names(data) %in% c("Date","Time"))]
data <- cbind(dateTime, data)
data$dateTime <- as.POSIXct(dateTime)

##plot1##
png("plot1.png", height = 480, width = 480)
hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")
dev.off()
