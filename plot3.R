plot3 <- function() {
  ## This function reads the Individual household electric power consumption
  ## Data Set from the UC Irvine Machine Learning Repository. It draws a
  ## plot of three energy submetering areas versus time for the days
  ## 2/1/2007 and 2/2/2007 and saves it in a png file.
  
  ## Read the Individual household electric power consumption Data Set
  power <- read.table("household_power_consumption.txt", sep = ";",
                      header = TRUE, na.string = "?")
  
  ## Only using data from the dates 2007-02-01 and 2007-02-02
  feb <- power[with(power, Date == "1/2/2007" | Date == "2/2/2007"), ]
  
  ## Create a datetime column to be used in the plot
  feb$datetime <- paste(feb$Date, feb$Time)
  feb$datetime <- strptime(feb$datetime, "%d/%m/%Y %H:%M:%S")
  
  ## Draw a plot of three energy submetering areas versus time in a 
  ## png file called plot3.png
  png(filename = "plot3.png", width = 480, height = 480)
  with(feb, plot(datetime, Sub_metering_1, type = "l", xlab = "",
                 ylab = "Energy sub metering"))
  with(feb, points(datetime, Sub_metering_2, type = "l", col = "red"))
  with(feb, points(datetime, Sub_metering_3, type = "l", col = "blue"))
  legend("topright", lty = "solid", col = c("black", "red", "blue"),
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  result <- dev.off()
}