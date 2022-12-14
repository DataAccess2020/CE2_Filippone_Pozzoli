library(rvest)
library(XML)
library(tidyverse)

#We create a vector with all the pages links 

webpages <- str_c("https://beppegrillo.it/category/archivio/2016/page/", 1:47) %>%
  paste0("/")
webpages

# We create the 'download_politely' function

download_politely <- function(from_url, to_html, my_email, my_agent = R.Version()$version.string) {
  
  require(httr)
  
  # Check that arguments are inputted as expected:
  stopifnot(is.character(from_url))
  stopifnot(is.character(to_html))
  stopifnot(is.character(my_email))
  
  # GET politely
  simps_req <- httr::GET(url = from_url, 
                         add_headers(
                           From = my_email, 
                           `User-Agent` = R.Version()$version.string
                         )
  )
  # If status == 200, extract content and save to a file:
  if (httr::http_status(simps_req)$message == "Success: (200) OK") {
    bin <- content(simps_req, as = "raw")
    writeBin(object = bin, con = to_html)
  } else {
    cat("Houston, we have a problem!")
  }
}

download_politely(from_url = url2, 
                  to_html = here::here("beppegrillo_polite.html"), 
                  my_email = "cristina.pozzoli@icloud.com")

#creation of a new folder where to store all the files 
dir.create("folder_beppe")

# Use the for loop function to download the pages as files inside a new folder 

for (i in seq_along(webpages)) {
  cat(i, " ")
  
  download_politely(from_url = webpages[i], 
                    to_html = here::here("folder_beppe", str_c("page_",i,".html")), 
                    my_email = "cristina.pozzoli@icloud.com")
  
  Sys.sleep(2)
}