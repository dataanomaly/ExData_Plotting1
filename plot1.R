plot1 <- function() {
  ## This function reads the Individual household electric power consumption
  ## Data Set from the UC Irvine Machine Learning Repository. It draws a
  ## histogram of the household global minute-averaged active power for
  ## the days 2/1/2007 and 2/2/2007 and saves it in a png file.
  
  ## Read the Individual household electric power consumption Data Set
  power <- read.table("household_power_consumption.txt", sep = ";",
                      header = TRUE, na.string = "?")

  ## Only using data from the dates 2007-02-01 and 2007-02-02
  feb <- power[with(power, Date == "1/2/2007" | Date == "2/2/2007"), ]
  
  ## Draw a histogram of the household global minute-averaged active 
  ## power (in kilowatts) in a png file called plot1.png
  png(filename = "plot1.png", width = 480, height = 480)
  hist(feb$Global_active_power, col = "red", main = "Global Active Power",
       xlab = "Global Active Power (kilowatts)")
  result <- dev.off()
}