#Exploratory Data Analysis _ Peer Review Assignment 1 - plot3.R 
library(ggplot2)
library(reshape)

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
# new df for melting (just not to reload the data all the time during testing different ways)
test1 <- subset(df_subset[,c('Sub_metering_1','Sub_metering_2','Sub_metering_3','DateTime')])
test1$DateTime <- as.POSIXct(test1$DateTime, "%Y-%m-%d %H:%M:%S")
test1 <- melt(test1, id.vars='DateTime')

# create histogram and save is a png 
plot3 <- ggplot(data=test1) + geom_line(aes(DateTime, value,col=variable)) +
  scale_color_manual(values = c('#3A3434','#EC1F1F','#2E48F3')) + 
  theme(legend.position = c(0.94,0.93)) + theme(legend.title = element_blank()) + 
  theme(legend.text = element_text(size=10)) + 
  theme(legend.background = element_rect(color='black', size=0.2)) +
  scale_x_datetime(date_labels ="%a", breaks = 'day') + 
  theme(axis.title.x = element_blank()) + ylab("Energy sub metering")
ggsave('plot3.png', width=16, height = 9)


# create plot 4 and save as a png 
png('plot4.png', height = 1000, width = 1000)
par(mfrow=c(2,2))
plot1 <- plot(x=df_subset$DateTime, y=df_subset$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
plot2 <- plot(x=df_subset$DateTime, y=df_subset$Voltage, type="l", ylab="Voltage", xlab="datetime")
plot3 <- ggplot(data=test1) + geom_line(aes(DateTime, value,col=variable)) +
  scale_color_manual(values = c('#3A3434','#EC1F1F','#2E48F3')) + 
  theme(legend.position = c(0.94,0.93)) + theme(legend.title = element_blank()) + 
  theme(legend.text = element_text(size=10)) + 
  theme(legend.background = element_rect(color='black', size=0.2)) +
  scale_x_datetime(date_labels ="%a", breaks = 'day') + 
  theme(axis.title.x = element_blank()) + ylab("Energy sub metering")
plot4 <- plot(x=df_subset$DateTime, y=df_subset$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
dev.off()