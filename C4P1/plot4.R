##read the data frame
cn=colnames(read.table("./household_power_consumption.txt", nrow = 1,sep=";",header = TRUE))
s<-grep("1/2/2007",readLines("./household_power_consumption.txt"))
mdata<-read.table("./household_power_consumption.txt",sep=";",header=T,skip=s-2,nrows=2880,col.names = cn)


##plot4
png(filename="plot4.png",width = 480, height = 480)

par(mfrow=c(2,2))

plot(1:2880,mdata$Global_active_power,ylab="Global Active Power (kilowatt)",xaxt = "n",type="l",xlab="")
axis(1, at=c(1,1440,2880), labels=c("Thu","Fri","Sat"))

plot(1:2880,mdata$Voltage,ylab="Voltage",xaxt = "n",type="l",xlab="datetime")
axis(1, at=c(1,1440,2880), labels=c("Thu","Fri","Sat"))


plot(1:2880,mdata$Sub_metering_1,type="n",ylab="Energy sub metering",xaxt = "n",xlab="")
lines(1:2880,mdata$Sub_metering_1,col="black")
lines(1:2880,mdata$Sub_metering_2,col="red")
lines(1:2880,mdata$Sub_metering_3,col="blue")
axis(1, at=c(1,1440,2880), labels=c("Thu","Fri","Sat"))
legend("toprigh",lty=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),bty = "n")

plot(1:2880,mdata$Global_reactive_power,ylab="Global_reactive_power",xaxt = "n",type="l",xlab="datetime")
axis(1, at=c(1,1440,2880), labels=c("Thu","Fri","Sat"))


dev.off()