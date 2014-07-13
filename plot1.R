#Set working directory to the directory where you have the .txt file we need.
data<-read.delim("household_power_consumption.txt", sep=";", dec=".", na.strings="?", header=T)
head(data)
data$Date<-as.Date(data$Date, "%d/%m/%Y")
dim(data)
dat<-data[data$Date %in% as.Date(c("2007-02-01","2007-02-02"), "%Y-%m-%d"),]
head(dat)
dim(dat)
summary(dat)
attach(dat)
par(bg="white")
hist(Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png")
dev.off()