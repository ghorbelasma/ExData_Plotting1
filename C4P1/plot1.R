##read the data frame
cn=colnames(read.table("./household_power_consumption.txt", nrow = 1,sep=";",header = TRUE))
s<-grep("1/2/2007",readLines("./household_power_consumption.txt"))
mdata<-read.table("./household_power_consumption.txt",sep=";",header=T,skip=s-2,nrows=2880,col.names = cn)

##plot1

hist(mdata$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatt)",col="red")
dev.copy(png,file="plot1.png",width = 480, height = 480)
dev.off()