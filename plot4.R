plot4 <- function() {
  ## This function reads the Individual household electric power consumption
  ## Data Set from the UC Irvine Machine Learning Repository. It draws a
  ## panel of four plots for days 2/1/2007 and 2/2/2007 and saves it 
  ## in a png file.
  ## 1. The household global minute-averaged active power versus time
  ## 2. The minute averaged voltage versus time
  ## 3. Three sub metering areas versus time
  ## 4. The household global minute-averaged reactive power versus time
  
  ## Read the Individual household electric power consumption Data Set
  power <- read.table("household_power_consumption.txt", sep = ";",
                      header = TRUE, na.string = "?")
  
  ## Only using data from the dates 2007-02-01 and 2007-02-02
  feb <- power[with(power, Date == "1/2/2007" | Date == "2/2/2007"), ]
  
  ## Create a datetime column to be used in the plot
  feb$datetime <- paste(feb$Date, feb$Time)
  feb$datetime <- strptime(feb$datetime, "%d/%m/%Y %H:%M:%S")
  
  png(filename = "plot4.png", width = 480, height = 480)
  par(mfrow = c(2, 2))
  
  ## Draw a plot of the household global minute-averaged active 
  ## power (in kilowatts) versus time
  with(feb, plot(datetime, Global_active_power, type = "l", xlab = "",
                 ylab = "Global Active Power"))

  ## Draw a plot of the minute averaged voltage versus time
  with(feb, plot(datetime, Voltage, type = "l", ylab = "Voltage"))

  ## Draw a plot of three energy submetering areas versus time
  with(feb, plot(datetime, Sub_metering_1, type = "l", xlab = "",
                 ylab = "Energy sub metering"))
  with(feb, points(datetime, Sub_metering_2, type = "l", col = "red"))
  with(feb, points(datetime, Sub_metering_3, type = "l", col = "blue"))
  legend("topright", lty = "solid", col = c("black", "red", "blue"),
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

  ## Draw a plot of the household global minute-averaged reactive 
  ## power (in kilowatts) versus time
  with(feb, plot(datetime, Global_reactive_power, type = "l"))

  result <- dev.off()
}