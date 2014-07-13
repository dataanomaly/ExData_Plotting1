plot2 <- function() {
  ## This function reads the Individual household electric power consumption
  ## Data Set from the UC Irvine Machine Learning Repository. It draws a
  ## plot of the household global minute-averaged active power versus time
  ## for the days 2/1/2007 and 2/2/2007 and saves it in a png file.
  
  ## Read the Individual household electric power consumption Data Set
  power <- read.table("household_power_consumption.txt", sep = ";",
                      header = TRUE, na.string = "?")
  
  ## Only using data from the dates 2007-02-01 and 2007-02-02
  feb <- power[with(power, Date == "1/2/2007" | Date == "2/2/2007"), ]
  
  ## Create a datetime column to be used in the plot
  feb$datetime <- paste(feb$Date, feb$Time)
  feb$datetime <- strptime(feb$datetime, "%d/%m/%Y %H:%M:%S")
  
  ## Draw a plot of the household global minute-averaged active 
  ## power (in kilowatts) versus time in a png file called plot2.png
  png(filename = "plot2.png", width = 480, height = 480)
  with(feb, plot(datetime, Global_active_power, type = "l", xlab = "",
                 ylab = "Global Active Power (kilowatts)"))
  result <- dev.off()
}