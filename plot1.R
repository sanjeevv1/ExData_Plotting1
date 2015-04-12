library(data.table)
library(graphics)
library(grDevices)

## Read input data for Feb 1 and 2, 2007 by skipping over the first 66637 rows and
## reading the next 2880 and ignoring the rest
x<-data.table(read.table("./household_power_consumption.txt",sep=";",skip=66637,nrows=2880))

png(file="plot1.png",width=480,height=480)
par(mar=c(4,5,2,1),oma=c(0,0,2,0))
hist(x$V3,xlab="Global Active Power (kilowatts)",col="red",main="Global Active Power")
mtext("Plot 1",outer=TRUE,adj=0,font=2,cex=2)
dev.off()
