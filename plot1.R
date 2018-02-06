plot1 <- function() {
  library(ggplot2)
  url <- "https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"
  download.file(url, "electricpowerconsumption.zip")
  unzip("electricpowerconsumption.zip")
  
  raw <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
  raw$Date = as.Date(raw$Date, "%d/%m/%Y")
  data <- raw[which(raw$Date == "2007-02-01" | raw$Date == "2007-02-02"),]
  data$Date <- paste(as.character(data$Date), data$Time)
  data$Date <- strptime(data$Date, "%Y-%m-%d %H:%M:%S")
  
  png("plot1.png")
  hist(as.numeric(data$Global_active_power), xlab = "Global Active Power", ylab = "Frequency", col = "red", main = "Global Active Power")
  dev.off()
}