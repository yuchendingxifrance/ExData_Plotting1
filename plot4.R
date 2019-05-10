## read data into R
electric<-read.table("household_power_consumption.txt",
                     sep=";",dec=".",na.strings = "?",
                     header=TRUE,stringsAsFactors = FALSE)
library(lubridate)

electric$Date<-dmy(electric$Date)



electric2<-electric[(electric$Date>='2007-02-01' & 
                             electric$Date <='2007-02-02'),]

### 
electric2$Date<-as.Date(electric2$Date,format="%d/%m/%Y")
daytime<-paste(electric2$Date,electric2$Time)
electric2$daytime<-as.POSIXct(daytime)


png("plot4.png",width=480,height=480)
par(mfrow=c(2,2),mar=c(4,4,2,1),oma=c(0,0,1,0))

## plot1
plot(electric2$daytime,electric2$Global_active_power,type="l",
     ylab="Global Active Power (kilowatts)")
## plot2
plot(electric2$daytime,electric2$Voltage,type="l",xlab="daytime",
     ylab="Voltage(volt)")
## plot3
with(electric2,{plot(Sub_metering_1~daytime,type="l",xlab="", ylab="Global Active Power (kilowatts)")
        lines(Sub_metering_2~daytime,col="red")
        lines(Sub_metering_3~daytime,col="blue")
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
               })

## plot4
plot(electric2$Global_active_power~electric2$daytime,type="l",
     xlab="daytime",ylab="Global_active_power")

dev.off








