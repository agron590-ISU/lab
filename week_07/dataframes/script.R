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

#Let's get rid of some rows - like everything, there are a lot of ways 
  
  recent<-less_columns[less_columns$Year != 1866, ]
  
  recent<-less_columns[less_columns$Year %in% c(1867:2015),]  
  
  recent<-less_columns[1:6819,]  
  
#Now let's subset soybeans  
  beans<-recent[recent$Commodity == "SOYBEANS" & recent$Data.Item == "SOYBEANS - YIELD, MEASURED IN BU / ACRE",]  
  
#These columns names are driving me crazy  
  colnames(beans)<-c("year", "state", "commodity", "measure", "bu_acre")  
  beans<-beans[,-4]
  
#I have some class problems
  beans$bu_acre<-as.numeric(beans$bu_acre)
  beans$year<-as.numeric(beans$year)  
  
#Add a unit conversion  
  beans$Mg_ha<-beans$bu_acre*60*0.00045*0.40
  
mod<-lm(beans$bu_acre ~ beans$year)

summary(mod)

  