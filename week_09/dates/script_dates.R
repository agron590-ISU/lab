###Dates, dplyr, tidyr
library(tidyverse)

data_dictionary<-data.frame(c("date", "rain", "soil_water", "soy_yield", "maize_yield", "nh4",
                              "no3", "n_fixation", "n_leaching", "soil_n_min", "n_uptake"), 
                            c("dd/mm/yyyy", "mm", "mm", "degC", "kg/ha", "kg/ha", "kg/mg",
                              "kg/mg", ))
df<-read_csv("future.csv")  

  
