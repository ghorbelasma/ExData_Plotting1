##read the data frame
cn=colnames(read.table("./household_power_consumption.txt", nrow = 1,sep=";",header = TRUE))
s<-grep("1/2/2007",readLines("./household_power_consumption.txt"))
mdata<-read.table("./household_power_consumption.txt",sep=";",header=T,skip=s-2,nrows=2880,col.names = cn)


##plot2

plot(1:2880,mdata$Global_active_power,ylab="Global Active Power (kilowatt)",xaxt = "n",type="l",xlab="")
axis(1, at=c(1,1440,2880), labels=c("Thu","Fri","Sat"))
dev.copy(png,file="plot2.png",width = 480, height = 480)
dev.off()