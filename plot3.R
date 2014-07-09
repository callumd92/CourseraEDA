
hpc<-read.table("household_power_consumption.txt", header=TRUE, sep = ";",na.strings="?")
##Read in household_power_consumption.txt with, separator=; and NAs=?
	hpc$DateTime <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")
##CreateDateTime column
	hpc[,"Date"]<-as.Date(hpc[,"Date"],format="%d/%m/%Y")
##convert date column to date class
 	hpc_sub<-subset(hpc, Date > as.Date("2007-01-31") & Date < as.Date("2007-02-03"))
##subset by dates
	plot(hpc_sub$DateTime,hpc_sub$Sub_metering_1,col=c("black"),type= "l",ylab="Energy sub metering",xlab= "")
	lines(hpc_sub$DateTime,hpc_sub$Sub_metering_2, col=c("red"),type= "l")
	lines(hpc_sub$DateTime,hpc_sub$Sub_metering_3, col=c("blue"),type= "l")
	legend("topright",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lwd=1, col=c("black","red","blue"))
##plot line of sub meters vs datetime
dev.copy(png, file = "plot3.png",width=480, height=480)
##copy screen plot3 png.
dev.off()
##close png device
