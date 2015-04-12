get_plot2 <- function() {
  
  ############ NOTE: the power text file needs to be in a subdirectory called Data from the R code ##############
  
  ## run function get_plot2 to create plot2 as a PNG file
  
  ## read text file into R, data is seperated by ";" and the first row has header names, declare first two columns as characters 
  ## and the remainder as numeric
  power_data <- temp_data <- read.table("./Data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
  
  
  #replace dataframe with rows only for dates 2007-02-01 or 2007-02-02
  power_data <- power_data[power_data$Date == "1/2/2007" | power_data$Date == "2/2/2007",]
  
  
  #combine Date and Time into Date/Time variable called date_combined
  power_data$date_combined = paste(power_data$Date, power_data$Time)
  
  
  #convert date_combined into date/time field in form of YYYY-MM-DD HH-MM-SS
  power_data$date_combined = strptime(power_data$date_combined, "%d/%m/%Y %H:%M:%S")
  
  
  #create Plot 2 as PNG
  png(file = "plot2.png", width = 480, height = 480, units = "px")
  with(power_data, plot(date_combined, Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", pch = NA_integer_))
  lines(power_data$date_combined, power_data$Global_active_power, type = "l")
  dev.off()
  
  
}
