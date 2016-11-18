library(tidyverse)
library(rvest)

# search for articles on nitrogen
base_url <- "http://www.mdpi.com"
url <- paste0(base_url, "/search?q=nitrogen&authors=&article_type=&journal=agronomy&section=&special_issue=&search=Search")

# get all links in the page
articles <- read_html(url)
articles %>%
  html_nodes("a") -> links

# filter out only HTML full text links
links %>%
  html_text() -> link_names

links["HTML Full-text" == link_names] %>%
  html_attr(name = "href") -> article_urls

# follow links and scrape for first table
article <- read_html(paste0(base_url, article_urls[1]))

article %>%
  html_node("#html-article-title") %>%
  html_text() -> title

article %>%
  html_node(".html-author-group") %>%
  html_text(trim = TRUE) -> authors

article %>%
  html_node(".html-history") %>%
  html_text() -> dates

article %>%
  html_table(fill = TRUE) -> table_list

info <- tibble(title = title, authors = authors, dates = dates, tables=list(table_list))

# make it a function
get_info <- function(url) {
  # follow links and scrape for info
  article <- read_html(paste0(base_url, url))
  
  article %>%
    html_node("#html-article-title") %>%
    html_text() -> title
  
  article %>%
    html_node(".html-author-group") %>%
    html_text(trim = TRUE) -> authors
  
  article %>%
    html_node(".html-history") %>%
    html_text() -> dates
  
  article %>%
    html_table(fill = TRUE) -> table_list
  
  #error handling
  if(length(table_list) == 0) table_list <- NA
  
  info <- tibble(title = title, authors = authors, dates = dates, tables = list(table_list))
  return(info)
}

# apply function to every url
res <- tibble()
for(url in article_urls) {
  res <- rbind(res, get_info(url))
}

