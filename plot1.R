#Exploratory Data Analysis _ Peer Review Assignment 1 - plot1.R 

df <- read.csv(file ='household_power_consumption.txt',header = TRUE, sep = ";", stringsAsFactors = FALSE) 
df$Date <- strptime(df[,1],"%d/%m/%Y")
df_subset <- df[df$Date =='2007-02-01' | df$Date=='2007-02-02',]

df_subset$Time <- strptime(df_subset[,2],"%H:%M:%S")
df_subset$Global_active_power <- as.numeric(df_subset$Global_active_power)
df_subset$Global_reactive_power <- as.numeric(df_subset$Global_reactive_power)
df_subset$Voltage <- as.numeric(df_subset$Voltage)
df_subset$Global_intensity <- as.numeric(df_subset$Global_intensity)
df_subset$Sub_metering_1 <- as.numeric(df_subset$Sub_metering_1)
df_subset$Sub_metering_2 <- as.numeric(df_subset$Sub_metering_2)
df_subset$Sub_metering_3 <- as.numeric(df_subset$Sub_metering_3)

# create histogram and save is a png 
png('plot1.png', width = 480, height = 480)
plot1 <- hist(df_subset$Global_active_power, main= "Global Active Power" ,col ='red', xlab = 'Global Active Power (kilowatts)')
dev.off()



