## ---- echo=FALSE---------------------------------------------------------
library(ggplot2)
library(maps)

states <- map_data("state")
load("data/noaa.rdata")

## ---- fig.height=3, fig.width=7, warning=FALSE---------------------------
ggplot() +
    geom_path(data = states, aes(x = long, y = lat, group = group)) + 
    geom_point(data = floats, aes(x = Longitude, y = Latitude, colour = callSign)) +   
    geom_point(aes(x, y), shape = "x", size = 5, data = rig) + 
    geom_text(aes(x, y), label = "BP Oil Rig", size = 5, data = rig, hjust = -0.1) + 
    xlim(c(-91, -80)) + 
    ylim(c(22, 32)) + coord_map()

## ------------------------------------------------------------------------
animal <- read.csv("http://heike.github.io/rwrks/02-r-graphics/data/animal.csv")

## ---- message=FALSE, out.height="250px"----------------------------------
library(tidyverse)
data(baseball, package="plyr")

baseball %>%
  filter(ab > 0) %>% #only players that have ever had an at bat
  group_by(year) %>%
  mutate(ba = h/ab,
         mean_ba = mean(h/ab)) %>%
  ggplot() +
  geom_point(aes(year, ba), alpha = .1) +
  geom_line(aes(year, mean_ba), colour = "blue")

## ------------------------------------------------------------------------
ff <- read.csv("http://heike.github.io/rwrks/03-r-format/data/frenchfries.csv")

