## read data into R
electric<-read.table("household_power_consumption.txt",
                     sep=";",dec=".",na.strings = "?",
                     header=TRUE,stringsAsFactors = FALSE)

library(lubridate)

electric$Date<-dmy(electric$Date)

electric2<-electric[(electric$Date>='2007-02-01' & 
                            electric$Date <='2007-02-02'),]

### make the plot1.png

## create a plot
hist(electric2$Global_active_power,breaks=13,col="red",
     main="Global Active Power")

## copy my plot to a PNG file
dev.copy(png,"plot1.png")
dev.off()



