plot1 <- function() {
  ## Read in selected data using read.table; take in top of data as separate table
  ## to get column names, then convert date and time to POSIXt class
  data <- read.table("EDA/household_power_consumption.txt", header=F, sep=";", na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), nrows=2880,skip=66637)
  data_head <- read.table("EDA/household_power_consumption.txt", header=T, sep=";", na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), nrows=5)
  colnames(data) <- names(data_head)
  data$datetime <- strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
  
  ## Generate plot
  png(file="plot1.png")
  with(data,hist(Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red"))
  dev.off()
}