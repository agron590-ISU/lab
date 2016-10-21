###Dates, dplyr, tidyr
library(tidyverse)

data_dictionary<-data.frame(variable = c("date", "rain", "soil_water", "soil_temp", "soy_yield", "maize_yield", "nh4",
                              "no3", "n_fixation", "n_leaching", "soil_n_min", "n_uptake"), 
                            unit = c("dd/mm/yyyy", "mm", "mm", "degC", "kg/ha", "kg/ha", "kg/mg",
                              "kg/mg", "kg", "kg", "kg", "kg"), 
                            definition = c("date", "mm of rain", 
                                            "amount of water in the soil to 15 cm", 
                                           "soil temp at 15 cm", "soybean grain yield",
                                           "maize grain yield", "ammonium concentration in soil", 
                                           "nitrate concentration in soil", "kg of nitrogen fixed", 
                                           "kg of nitrogen leached", 
                                            "kg of soil nitrogen produced by mineralization", 
                                            "kg of nitrogen taken up by the plant" ))
future<-read_csv("future.csv", na = "?")  

#Use `qplot(x, y, data=future)` to explore a few simple relationships
#Try `qplot(date, y, data=future) (may take a minute to print)

#Change the dates to the proper format and plot again
#Add a year column  
#Add a month column  
#Add day of year  

#Sum rainfall ammounts for each year and plot across time
#Find the average soil temp for each year  


  
