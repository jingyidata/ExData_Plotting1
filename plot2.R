# read data file into R
library(sqldf)
fname="household_power_consumption.txt"
data=read.csv2.sql(file = fname,sql="SELECT * FROM file WHERE Date='1/2/2007' or Date= '2/2/2007'",header = TRUE) 

# Convert the Date and Time variables to Date/Time classes, add a column DataTime
data$datetime=paste(data$Date,data$Time,sep=" ")
data$datetime=strptime(data$datetime,format = "%d/%m/%Y %H:%M:%S")

#make the plot and save it to a png file
png(filename = "plot2.png",width = 480, height = 480)
with(data,plot(datetime,Global_active_power,xlab = "",ylab = "Global Active Power (kilowatts)" , type = "l"))
dev.off()