library(data.table)
library(graphics)
library(grDevices)

## Read input data from file for Feb 1,2 2007, only. Skip over the initial 66637 rows
## then read 2880 records (1440 for each day) and ignore the rest
x<-data.table(read.table("./household_power_consumption.txt",sep=";",skip=66637,nrows=2880))


## set up date and time parameters for X-axis to display properly
x$temp<-as.character(x$V2)
x$date<-as.Date(x$V1,format="%d/%m/%Y")
x$daytimechar<-paste(x$date," ",x$temp)
x$daytime<-as.POSIXct(x$daytimechar)


# Plot 3
png(file="plot3.png",width=480,height=480)
par(mar=c(4,5,2,1),oma=c(0,0,2,0))

## set up plot first and then add the three sub metering lines and then legend
plot(x$daytime,x$V7,type="n",ylab="Energy sub metering",xlab="",lwd=3)
mtext("Plot 3",outer=TRUE,adj=0,font=2,cex=2)
lines(x$daytime,x$V7,col="black",lwd=1)
lines(x$daytime,x$V8,col="red",lwd=1)
lines(x$daytime,x$V9,col="blue",lwd=1)
legend("topright",pch="________",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
