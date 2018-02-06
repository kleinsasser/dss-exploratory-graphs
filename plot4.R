plot4 <- function() {
  library(ggplot2)
  url <- "https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"
  download.file(url, "electricpowerconsumption.zip")
  unzip("electricpowerconsumption.zip")
  
  raw <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
  raw$Date = as.Date(raw$Date, "%d/%m/%Y")
  data <- raw[which(raw$Date == "2007-02-01" | raw$Date == "2007-02-02"),]
  data$Date <- paste(as.character(data$Date), data$Time)
  data$Date <- strptime(data$Date, "%Y-%m-%d %H:%M:%S")
  
  png("plot4.png")
  par(mfrow = c(2,2))
  with(data, plot(Date, Global_active_power, type = "l"))
  with(data, plot(Date, Voltage, type = "l"))
  with(data, plot(Date, Sub_metering_1, type = "l"))
  lines(data$Date, data$Sub_metering_2, col = "red")
  lines(data$Date, data$Sub_metering_3, col = "blue")
  legend("topright", 30, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, cex = 0.4)
  with(data, plot(Date, Global_reactive_power, type = "l"))
  dev.off()
}