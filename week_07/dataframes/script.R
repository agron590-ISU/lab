getwd()
setwd()

crops<-read.csv("NASS-Iowa.csv")  #ctr+enter will run the line you are on  

head(crops)  #I like to glance at the data
tail(crops)  # BTW, hashtag is used to insert commments

#Let's get rid of some columns

  #Choose the column you want to keep
  less_columns<-crops[,c("Year", "State", "Commodity", "Data.Item", "Value")]

  #Choose columns you don't want to keep
  fewer_columns<-crops[, -c("Program", "Year", "Period", "Week.Ending", 
                        "Geo.Level", "State.ANSI", "Ag.Distric")]  

  #Can also specify by column number  
  notsomany_columns<-crops[,c(2, 6, 16 ,17, 20)]

#Let's get rid of some rows
  
  recent<-less_columns[less_columns$Year != 1866, ]
  
  recent<-less_columns[less_columns$Year %in% c(1867:2015),]
  