# We have to scrape the main text for each downloaded page 

library(rvest)
library(stringr)

scrape_posts <- list.files(here::here("Blog_posts"), pattern="*.html", full.names = TRUE)

blog_main_text <- lapply(scrape_posts, function(x) {
  read = read_html(x) %>% 
    html_elements(css = "p") %>% 
    html_text(trim = TRUE)
})

# Check the result 
blog_main_text[[4]]


