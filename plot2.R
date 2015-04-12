library(data.table)
library(graphics)
library(grDevices)

## Read input data from file for Feb 1,2 2007, only. Skip over the initial 66637 rows
## then read 2880 records (1440 for each day) and ignore the rest
x<-data.table(read.table("./household_power_consumption.txt",sep=";",skip=66637,nrows=2880))


png(file="plot2.png",width=480,height=480)

## Do the date and time manipulation to get the x-axis plotted correctly
x$temp<-as.character(x$V2)
x$date<-as.Date(x$V1,format="%d/%m/%Y")
x$daytimechar<-paste(x$date," ",x$temp)
x$daytime<-as.POSIXct(x$daytimechar)

# set up the parameters and plot the chart
par(mar=c(4,5,2,1),oma=c(0,0,2,0))
plot(x$daytime,x$V3,type="l",ylab="Global Active Power (kilowatts)",xlab=" ")
mtext("Plot 2",outer=TRUE,adj=0,font=2,cex=2)
dev.off()
