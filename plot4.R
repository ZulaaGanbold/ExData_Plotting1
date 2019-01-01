#Exploratory Data Analysis _ Peer Review Assignment 1 - plot3.R 
library(ggplot2)
library(reshape)
# read data 
df <- read.csv(file ='household_power_consumption.txt',header = TRUE, sep = ";", stringsAsFactors = FALSE) 
df$Date <- strptime(df[,1],"%d/%m/%Y")
df_subset <- df[df$Date =='2007-02-01' | df$Date=='2007-02-02',]

df_subset$DateTime <- as.POSIXct(paste(df_subset$Date, df_subset$Time), format = "%Y-%m-%d %H:%M:%S")

df_subset$Time <- strptime(df_subset[,2],"%H:%M:%S")
df_subset$Global_active_power <- as.numeric(df_subset$Global_active_power)
df_subset$Global_reactive_power <- as.numeric(df_subset$Global_reactive_power)
df_subset$Voltage <- as.numeric(df_subset$Voltage)
df_subset$Global_intensity <- as.numeric(df_subset$Global_intensity)
df_subset$Sub_metering_1 <- as.numeric(df_subset$Sub_metering_1)
df_subset$Sub_metering_2 <- as.numeric(df_subset$Sub_metering_2)
df_subset$Sub_metering_3 <- as.numeric(df_subset$Sub_metering_3)

# create histogram 1 and save is a png 
png('plot1.png', width = 480, height = 480)
plot1 <- hist(df_subset$Global_active_power, main= "Global Active Power" ,col ='red', xlab = 'Global Active Power (kilowatts)')
dev.off()

# create plot 2 and save is a png 
png('plot2.png', width = 480, height = 480)
plot2 <- plot(x=df_subset$DateTime, y=df_subset$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()

# create plot 3  and save is a png 
plot(x=df_subset$DateTime,y=df_subset$Sub_metering_1, type='l', col='black',ylab = "Energy sub metering", xlab = "")
lines(x=df_subset$DateTime,y=df_subset$Sub_metering_2, col='red')
lines(x=df_subset$DateTime,y=df_subset$Sub_metering_3, col='blue')
legend("topright", legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), 
       col=c('black','red','blue'),border='black', lty = 1, cex = 0.8, y.intersp = 0.75)

# create plot 4 and save as a png 
png('plot4.png', height = 1000, width = 1000)
par(mfrow=c(2,2))
plot1 <- plot(x=df_subset$DateTime, y=df_subset$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
plot2 <- plot(x=df_subset$DateTime, y=df_subset$Voltage, type="l", ylab="Voltage", xlab="datetime")
plot3 <- plot(x=df_subset$DateTime,y=df_subset$Sub_metering_1, type='l', col='black',ylab = "Energy sub metering", xlab = "")
lines(x=df_subset$DateTime,y=df_subset$Sub_metering_2, col='red')
lines(x=df_subset$DateTime,y=df_subset$Sub_metering_3, col='blue')
legend("topright", legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), 
       col=c('black','red','blue'),border='black', lty = 1, cex = 0.8, y.intersp = 0.75)

plot4 <- plot(x=df_subset$DateTime, y=df_subset$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
dev.off()


