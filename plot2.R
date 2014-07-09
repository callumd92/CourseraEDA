
hpc<-read.table("household_power_consumption.txt", header=TRUE, sep = ";",na.strings="?")
##Read in household_power_consumption.txt with, separator=; and NAs=?
	hpc$DateTime <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")
##CreateDateTime column
	hpc[,"Date"]<-as.Date(hpc[,"Date"],format="%d/%m/%Y")
##convert date column to date class
 	hpc_sub<-subset(hpc, Date > as.Date("2007-01-31") & Date < as.Date("2007-02-03"))
##subset by dates
plot(hpc_sub$DateTime,hpc_sub$Global_active_power, type= "l",ylab="Global active power (kilowatts)",xlab= "")
##plot line of global active power vs datetime
dev.copy(png, file = "plot2.png",width=480,height=480)
##copy screen plot2 png.
dev.off()
##close png device
