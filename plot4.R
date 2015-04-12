library(data.table)
library(graphics)
library(grDevices)

## Read input data from file for Feb 1,2 2007, only. Skip over the initial 66637 rows
## then read 2880 records (1440 for each day) and ignore the rest
x<-data.table(read.table("./household_power_consumption.txt",sep=";",skip=66637,nrows=2880))


## set up date and time manipulation for x-axis to display properly
x$temp<-as.character(x$V2)
x$date<-as.Date(x$V1,format="%d/%m/%Y")
x$daytimechar<-paste(x$date," ",x$temp)
x$daytime<-as.POSIXct(x$daytimechar)

# Plot4
 
png(file="plot4.png",width=480,height=480)

# set up display parameters to display four plots and then plot them
par(mfrow=c(2,2), mar=c(4,5,2,1),oma=c(0,0,2,0))
plot(x$daytime,x$V3,type="l",ylab="Global Active Power",xlab="")
mtext("Plot 4",outer=TRUE,adj=0,font=2,cex=2)
plot(x$daytime,x$V5,type="l",ylab="Voltage",xlab="datetime")
plot(x$daytime,x$V7,type="n",ylab="Energy sub metering",xlab="",lwd=3)
lines(x$daytime,x$V7,col="black",lwd=1)
lines(x$daytime,x$V8,col="red",lwd=1)
lines(x$daytime,x$V9,col="blue",lwd=1)
legend("topright",bty="n",pch="________",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(x$daytime,x$V4,type="l",ylab="Global_reactive_power",xlab="datetime")
dev.off()