library(rvest)
library(XML)
library(tidyverse)

#We create a vector with all the pages links 

webpages <- str_c("https://beppegrillo.it/category/archivio/2016/page/", 1:47) %>%
  paste0("/")
webpages
