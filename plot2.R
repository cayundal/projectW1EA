# 1. TIDY DATA
# Read the entire dataset to df. Corrects ? for NA

df<-read.csv("household_power_consumption.txt",sep = ';',colClasses = "character",na.strings=c("","?","NA"))

# Convert Date Time variables to Date/time Classes.

df$Date<-as.Date(df$Date, format="%d/%m/%Y")

# Subset from the dates 2007-02-01 and 2007-02-02

df<-df[which(df$Date=="2007-02-01" | df$Date=="2007-02-02"),]

# Merge Date and Time in single column Date

df$Date<-as.POSIXct(paste(df$Date, df$Time), format="%Y-%m-%d %H:%M:%S")

# 2 MAKE PLOT2
# Define ranges for plot function

xrange <- range(df$Date)
yrange <- range(as.numeric(df$Global_active_power))

# set up the plot

plot(xrange, yrange, type="n",xlab="",ylab="Global Active Power (kilowats)" )
lines(df$Date,as.numeric(df$Global_active_power))

# Export plot in png

dev.copy(png, file = "plot2.png",width = 480, height = 480)
dev.off()
