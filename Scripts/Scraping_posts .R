# SCREAPING TEXT

# We scrape all the links to the blog posts 
to_scrape <- list.files(here::here("folder_beppe"), full.names = TRUE)   # get the list of pages for the seasons
all_html_2016 <- vector(mode = "list", length = length(to_scrape))    # empty container where to place the titles

for (i in seq_along(all_html_2016)){
  all_html_2016[[i]] = XML::getHTMLLinks(to_scrape[i], externalOnly = T)
  
  Sys.sleep(0.5)
}

# We select only the links to the posts 

all_html_2016
all_html_2016_unl <- unlist(all_html_2016)
links <- str_extract_all(all_html_2016_unl, "https://beppegrillo\\.it/[^category][^jpg].+")
links_unl <- unlist(links)
links_unl
links_data <- as.data.frame(links_unl)
