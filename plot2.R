## read data into R
electric<-read.table("household_power_consumption.txt",
                     sep=";",dec=".",na.string="?",
                     header=TRUE,stringsAsFactors = FALSE)

library(lubridate)

electric$Date<-dmy(electric$Date)

electric2<-electric[(electric$Date>='2007-02-01' & 
                             electric$Date <='2007-02-02'),]


## make the plot2.png
png("plot2.png",width=480,height=480)
electric2$Date<-as.Date(electric2$Date,format="%d/%m/%Y")
daytime<-paste(electric2$Date,electric2$Time)
electric2$daytime<-as.POSIXct(daytime)
with(electric2,plot(daytime,
                    Global_active_power,type="l",
                    ylab="Global Active Power(watts)"))

dev.off()













