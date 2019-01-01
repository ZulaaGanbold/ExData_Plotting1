#Exploratory Data Analysis _ Peer Review Assignment 1 - plot2.R 

# read data 
df <- read.csv(file ='household_power_consumption.txt',header = TRUE, sep = ";", stringsAsFactors = FALSE) 
df$Date <- strptime(df[,1],"%d/%m/%Y")
df_subset <- df[df$Date =='2007-02-01' | df$Date=='2007-02-02',]

df_subset$DateTime <- as.POSIXct(paste(df_subset$Date, df_subset$Time), format = "%Y-%m-%d %H:%M:%S")

df_subset$Global_active_power <- as.numeric(df_subset$Global_active_power)
df_subset$Global_reactive_power <- as.numeric(df_subset$Global_reactive_power)
df_subset$Voltage <- as.numeric(df_subset$Voltage)
df_subset$Global_intensity <- as.numeric(df_subset$Global_intensity)
df_subset$Sub_metering_1 <- as.numeric(df_subset$Sub_metering_1)
df_subset$Sub_metering_2 <- as.numeric(df_subset$Sub_metering_2)
df_subset$Sub_metering_3 <- as.numeric(df_subset$Sub_metering_3)

# create graph and save is a png 
png('plot2.png', width = 480, height = 480)
plot2 <- plot(x=df_subset$DateTime, y=df_subset$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()



