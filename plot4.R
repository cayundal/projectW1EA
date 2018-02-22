# 1. TIDY DATA
# Read the entire dataset to df. Corrects ? for NA

df<-read.csv("household_power_consumption.txt",sep = ';',colClasses = "character",na.strings=c("","?","NA"))

# Convert Date Time variables to Date/time Classes.

df$Date<-as.Date(df$Date, format="%d/%m/%Y")

# Subset from the dates 2007-02-01 and 2007-02-02

df<-df[which(df$Date=="2007-02-01" | df$Date=="2007-02-02"),]

# Merge Date and Time in single column Date

df$Date<-as.POSIXct(paste(df$Date, df$Time), format="%Y-%m-%d %H:%M:%S")

# 2 MAKE PLOT4

# set up plot

par(mfrow = c(2,2))
par(mar=c(3,3,2.5,1))
par(mgp=c(2,1,0))

# plot 1,1 = plot2

xrange <- range(df$Date)
yrange <- range(as.numeric(df$Global_active_power))

# set up the plot

plot(xrange, yrange, type="n",xlab="",ylab="Global Active Power" )
lines(df$Date,as.numeric(df$Global_active_power))

# plot 1,2 = plot 2 but with voltage and xlab

xrange <- range(df$Date)
yrange <- range(as.numeric(df$Voltage))

# set up the plot

plot(xrange, yrange, type="n",xlab="datetime",ylab="Voltage" )
lines(df$Date,as.numeric(df$Voltage))

# plot 2,1 = plot 3 but without legend box lines

xrange <- range(df$Date)
yrange <- range(as.numeric(df$Sub_metering_1))

# set up the plot

plot(xrange, yrange, type="n",xlab="",ylab="Energy Submetering" )
lines(df$Date,as.numeric(df$Sub_metering_1))
lines(df$Date,as.numeric(df$Sub_metering_2),col="red")
lines(df$Date,as.numeric(df$Sub_metering_3),col="blue")
legend(x = c(1170410502.87,1170485649.6), y = c(39.52,28),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),lwd=c(2.5,2.5,2.5),,col=c("black","red","blue"),cex=0.5,y.intersp=0.75,xjust = 1,bty = "n")

# plot 2,2 = plot 1,2 but with global reactive power

xrange <- range(df$Date)
yrange <- range(as.numeric(df$Global_reactive_power))

# set up the plot

plot(xrange, yrange, type="n",xlab="datetime",ylab="Global_Reactive_Power" )
lines(df$Date,as.numeric(df$Global_reactive_power))

# Export plot in png

dev.copy(png, file = "plot4.png",width = 480, height = 480)
dev.off()

