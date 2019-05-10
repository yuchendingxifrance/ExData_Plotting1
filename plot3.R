## read data into R
electric<-read.table("household_power_consumption.txt",
                     sep=";",dec=".",na.strings = "?",
                     header=TRUE,stringsAsFactors = FALSE)
library(lubridate)

electric$Date<-dmy(electric$Date)


electric2<-electric[(electric$Date>='2007-02-01' & 
                             electric$Date <='2007-02-02'),]

## create plot3.png
png("plot3.png",width=480,height=480)
electric2$Date<-as.Date(electric2$Date,format="%d/%m/%Y")

daytime<-paste(electric2$Date,electric2$Time)
electric2$daytime<-as.POSIXct(daytime)

with(electric2,{plot(daytime,Sub_metering_1,
     xlab="",ylab="Energy sub metering",type="l")

lines(electric2$Sub_metering_2~daytime,col="red",type="l")
lines(electric2$Sub_metering_3~daytime,col="blue",type="l")
})

## legend
legend("topright",col=c("black","red","blue"),lty=1,lwd=2,
  legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off











