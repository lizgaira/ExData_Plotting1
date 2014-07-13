#Set working directory to the directory where you have the .txt file we need.

data<-read.delim("household_power_consumption.txt", sep=";", dec=".", na.strings="?", header=T)
data$Date<-as.Date(data$Date, "%d/%m/%Y")
dim(data)
dat<-data[data$Date %in% as.Date(c("2007-02-01","2007-02-02"), "%Y-%m-%d"),]
summary(dat)
head(dat)
datetime<- paste(dat$Date, dat$Time)
dat$datetime2<-strptime(datetime, "%Y-%m-%d %H:%M:%S")
attach(dat)
sapply(dat, class)
Sys.setlocale("LC_TIME", "English")
par(mfrow=c(2,2),bg="white")
names(dat)
#1
plot(datetime2, Global_active_power, type="l", ylab="Global Active Power", xlab="")
#2
plot(datetime2, Voltage, type="l", ylab="Voltage", xlab="")
#3
plot(datetime2, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime2,Sub_metering_2,col="red")
lines(datetime2,Sub_metering_3,col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n", cex=0.9,
   col=c("black","red","blue"), border = "black", lty=1)
#4
plot(datetime2, Global_reactive_power, type="l", xlab="")


dev.copy(png, file="plot4.png")
dev.off()