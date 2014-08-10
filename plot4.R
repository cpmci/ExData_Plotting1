plot4 <- function() {
  ## Read in selected data using read.table; take in top of data as separate table
  ## to get column names, then convert date and time to POSIXt class
  data <- read.table("EDA/household_power_consumption.txt", header=F, sep=";", na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), nrows=2880,skip=66637)
  data_head <- read.table("EDA/household_power_consumption.txt", header=T, sep=";", na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), nrows=5)
  colnames(data) <- names(data_head)
  data$datetime <- strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
  
  ##
  png(file="plot4.png")
  par(mfrow=c(2,2))
  with(data,plot(datetime,Global_active_power,type="l",ylab="Global Active Power",xlab=""))
  with(data,plot(datetime,Voltage,type="l"))
  with(data,plot(datetime,Sub_metering_1,type="l"))
  with(data,lines(datetime,Sub_metering_2,col="red"))
  with(data,lines(datetime,Sub_metering_3,col="blue"))
  with(data,legend(x="topright",names(data)[7:9],bty="n",cex=0.9,xjust=1,lty=c(1,1,1),lwd=c(1,1,1),col=c("black","red","blue")))
  with(data,plot(datetime,Global_reactive_power,type="l"))
  ## reactuve, Global_reactive_power
  dev.off()
}