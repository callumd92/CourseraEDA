
hpc<-read.table("household_power_consumption.txt", header=TRUE, sep = ";",na.strings="?")
##Read in household_power_consumption.txt with, separator=; and NAs=?
	hpc$DateTime <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")
##CreateDateTime column
	hpc[,"Date"]<-as.Date(hpc[,"Date"],format="%d/%m/%Y")
##convert date column to date class
 	hpc_sub<-subset(hpc, Date > as.Date("2007-01-31") & Date < as.Date("2007-02-03"))
##subset by dates
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
##setup 2x2 layout
	plot(hpc_sub$DateTime,hpc_sub$Global_active_power, type= "l",ylab="Global active power (kilowatts)",xlab= "")
##plot global_active_power vs datetime
	plot(hpc_sub$DateTime,hpc_sub$Voltage, type= "l",ylab="Voltage",xlab= "datetime")
##plot voltage vs datetime
	plot(hpc_sub$DateTime,hpc_sub$Sub_metering_1,col=c("black"),type= "l",ylab="Energy sub metering",xlab= "")
		lines(hpc_sub$DateTime,hpc_sub$Sub_metering_2, col=c("red"),type= "l")
		lines(hpc_sub$DateTime,hpc_sub$Sub_metering_3, col=c("blue"),type= "l")
		legend("topright",bty="n", border=NULL, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lwd=1, col=c("black","red","blue"))
##plot submeter values vs datetime
	plot(hpc_sub$DateTime,hpc_sub$Global_reactive_power, type= "l",ylab="Global_reactive_power",xlab= "datetime")
##plot global_reactive_power vs datetime
dev.copy(png, file = "plot4.png",width=480, height=480)
##copy screen plot4 png.
dev.off()
##close png device
