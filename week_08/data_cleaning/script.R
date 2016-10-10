#Clean up a data file so it is more useable  

#First, read it in to make it a dataframe with one header
#Select the line with the most useful information 
header_weather<-scan("weather.txt")
#Select all the data
weather<-read.table("weather.txt")
#Put the header and the data together
names(weather)<-header_weather

#Lets just work with time, total rainfall, total solar radiation, max air temp, and min air temp -- select these columns

#Give the column new names -- "date", "total_rain_in", "total_rad_MJ", "max_temp_F", "min_temp_F"

#Filter the data to make sure you have reasonable values
  #Between 0 and 6 for total rain
  #Between 60 and 100 for total radiation
  #Between -50 and -10 for both temps
  #max temp cannot be lower than min temp

#Create a rain column in millimeters and temperature columns in degrees C

#Create a column which labels anything before Sept 22 as "summer" and Sept 22 and after as "autumn" 

#Now get the date column to read as a date in R  

#Make a few simple plots of your data to see if it looks okay and everything is the right class

#Write the data to a .csv to share with your collaborator
write.csv(clean, file="2016 weather.csv", row.names=FALSE, quote=FALSE)

