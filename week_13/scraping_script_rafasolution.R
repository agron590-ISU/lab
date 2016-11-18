
# Solution by rafa
library(tidyverse)
library(rvest)

# search for articles on nitrogen
base_url <- "http://www.mdpi.com"
url <- paste0(base_url, "/search?q=nitrogen&authors=&article_type=&journal=agronomy&section=&special_issue=&search=Search")

# get all links in the page

page <- read_html(url)
page %>% html_nodes("a") -> links


# filter out only HTML full text links
links[grep("HTML Full-text", links)] %>%
  html_attr("href") -> links

# follow first link and scrape for title, author, dates, and tables 
#paper_url <- paste0(base_url, links[1])
#paper <- read_html(paper_url)
#paper %>% html_nodes("meta") -> paper_meta

#paper_meta[grep("citation_", paper_meta)]  %>% html_attr("content") -> content
#paper_meta[grep("citation_", paper_meta)]  %>% html_attr("name") -> name

#paper_meta <- data.frame(name = gsub("citation_","",name),content)
#paper %>% html_nodes("table") %>% html_table(fill = TRUE) %>% paper_tables

# make it a function

scrape_papers <- function(base_url, links) {
  
  out <- vector("list", length(links))
  
  for(i in 1:length(links)){
    
    paper_url <- paste0(base_url, links[i])
    paper <- read_html(paper_url)
    paper %>% html_nodes("meta") -> paper_meta
    
    paper_meta[grep("citation_", paper_meta)]  %>% html_attr("content") -> content
    paper_meta[grep("citation_", paper_meta)]  %>% html_attr("name") -> name
    
    paper_meta <- data.frame(name = gsub("citation_","",name),content)
    
    print(as.character(paper_meta[paper_meta$name == "title",2]))
    
    paper %>% html_nodes("table") %>% html_table(fill = TRUE) -> paper_tables
    
    out[[i]] <- list(meta=paper_meta,
                     tables=paper_tables)
    
  }
  return(out)
  
}

# apply function to every url

papers <- scrape_papers(base_url="http://www.mdpi.com",links=links)
