
hpc<-read.table("household_power_consumption.txt", header=TRUE, sep = ";",na.strings="?")
##Read in household_power_consumption.txt with, separator=; and NAs=?
	hpc$DateTime <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")
##CreateDateTime column
	hpc[,"Date"]<-as.Date(hpc[,"Date"],format="%d/%m/%Y")
##convert date column to date class
 	hpc_sub<-subset(hpc, Date > as.Date("2007-01-31") & Date < as.Date("2007-02-03"))
##subset by dates
hist(hpc_sub[,"Global_active_power"],col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
##histogram on screen device
dev.copy(png, file = "plot1.png",width=480,height=480)
##copy screen plot 1 png.
dev.off()
##close png device
