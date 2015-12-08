# read data file into R
library(sqldf)
fname="household_power_consumption.txt"
data=read.csv2.sql(file = fname,sql="SELECT * FROM file WHERE Date='1/2/2007' or Date= '2/2/2007'",header = TRUE) 

# Convert the Date and Time variables to Date/Time classes, add a column DataTime
data$datetime=paste(data$Date,data$Time,sep=" ")
data$datetime=strptime(data$datetime,format = "%d/%m/%Y %H:%M:%S")

#make the plot and save it to a png file
png(filename = "plot4.png",width = 480, height = 480)
par(mfrow=c(2,2))

with(data,{
        plot(datetime,Global_active_power,xlab = "",ylab = "Global Active Power" , type = "l")
        plot(datetime,Voltage,type = "l")
        plot(datetime,Sub_metering_1,xlab = "", ylab = "Energy sub metering" , type = "l")
        lines(datetime,Sub_metering_2,col="red")
        lines(datetime,Sub_metering_3,col="blue")
        legend("topright", lty=1, col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
        plot(datetime,Global_reactive_power,type = "l")
        })

dev.off()
