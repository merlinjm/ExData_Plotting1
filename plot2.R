library(lubridate)
png(filename = "plot2.png",width = 480, height = 480)
dat<-read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE,na.strings="?")
dat$Date<-as.Date(dat$Date, "%d/%m/%Y")
subdat<-subset(dat,dat$Date > as.Date("2007-01-31") & dat$Date < as.Date("2007-02-03"))
subdat$Time<-ymd_hms(paste(subdat$Date, subdat$Time))
plot(subdat$Time,as.numeric(subdat$Global_active_power),type="l", ylab = "Global Active Power (kilowatts)",xlab="")
dev.off()