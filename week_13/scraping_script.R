library(tidyverse)
library(rvest)

# search for articles on nitrogen
base_url <- "http://www.mdpi.com"
url <- paste0(base_url, "/search?q=nitrogen&authors=&article_type=&journal=agronomy&section=&special_issue=&search=Search")

# get all links in the page


# filter out only HTML full text links


# follow first link and scrape for title, author, dates, and tables 


# make it a function


# apply function to every url
