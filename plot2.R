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

## Plot the data of Global_active_power - Plot 2.
png("plot2.png",width=480, height=480)
plot(data$Datetime,data$Global_active_power,type="l",xlab="",
     ylab="Global Active Power (kilowatts)") 

dev.off()