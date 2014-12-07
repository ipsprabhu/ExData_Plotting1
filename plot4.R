## Read the file upto the date "2/2/2007 i.e., 69516 rows.
data_par<- read.table("household_power_consumption.txt",header=T,
                      stringsAsFactors=F,sep=";",nrows=69516)

## Convert the date value in character to data type Date in the format D-M-Y.
data_par$Date<- as.Date(data_par$Date,format="%d/%m/%Y")

## Subset the data to desired dates only.
data <- subset(data_par, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Convert the date and time into datetime format.
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime<- strptime(datetime,"%Y-%m-%d %H:%M:%S")

## Plot the graphs - Plot 4.
png("plot4.png",width=480, height=480)
par(mfrow = c(2,2))
with(data, { 
  plot(Datetime, Global_active_power, type="l", 
       ylab="Global Active Power", xlab="") 
  plot(Datetime, Voltage, type="l",
       ylab="Voltage", xlab="datetime")
  plot(Datetime, Sub_metering_1, type="l", 
       ylab="Energy sub metering", xlab="") 
  lines(Datetime, Sub_metering_2,col='Red') 
  lines(Datetime, Sub_metering_3,col='Blue') 
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1,bty="n",  
         c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 
    
  plot(Datetime, Global_reactive_power,type="l",
       ylab="Global_reactive_power", xlab="datetime") 
}) 

dev.off()