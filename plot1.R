# 1. TIDY DATA
# Read the entire dataset to df. Corrects ? for NA

df<-read.csv("household_power_consumption.txt",sep = ';',colClasses = "character",na.strings=c("","?","NA"))

# Convert Date Time variables to Date/time Classes.

df$Date<-as.Date(df$Date, format="%d/%m/%Y")

# Subset from the dates 2007-02-01 and 2007-02-02

df<-df[which(df$Date=="2007-02-01" | df$Date=="2007-02-02"),]

# Merge Date and Time in single column Date

df$Date<-as.POSIXct(paste(df$Date, df$Time), format="%Y-%m-%d %H:%M:%S")

# 2 MAKE PLOT

hist(as.numeric(df$Global_active_power), 
     +      main="Global Active Power", 
     +      xlab="Global Active Power (kilowats)", 
     +      border="black", 
     +      col="red",
     +      xlim=c(0,6),
     +      las=1, 
     +      breaks=12)

# Export plot in png

dev.copy(png, file = "plot1.png",width = 480, height = 480)
dev.off()





