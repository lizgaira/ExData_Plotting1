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

plot(datetime2, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png")
dev.off()