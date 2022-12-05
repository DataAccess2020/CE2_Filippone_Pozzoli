# SCREAPING POSTS

# We scrape all the links to the blog posts 
to_scrape <- list.files(here::here("folder_beppe"), full.names = TRUE)
all_html_2016 <- vector(mode = "list", length = length(to_scrape))  

for (i in seq_along(all_html_2016)){
  all_html_2016[[i]] = XML::getHTMLLinks(to_scrape[i], externalOnly = T)
  
  Sys.sleep(0.5)
}

# We select only the links to the posts 

all_html_2016_unl <- unlist(all_html_2016)
links <- str_extract_all(all_html_2016_unl, "https://beppegrillo\\.it/[^category][^jpg].+")
links_unl <- unlist(links)
links_data <- as.data.frame(links_unl)

#We have to delete the duplicates

prova1 <- unique(links_unl)

#We are not sure about the result, so we try to delete them with a for loop 

prova2 <- vector(mode = "list") 
k2=1

for(i in seq_along(links_unl)) {
  if(i == 1) {prova2[1] = links_unl[1]}
  flag = 0
  for (k in seq_along(prova2)) {
    if (links_unl[i]==prova2[k]) {flag=1}
  }
  if (flag==0) {k2=(k2+1)
  prova2[k2]=links_unl[i]
  }
}

# Also the for loop gives us the same result, so we create a new object 

links_blog_posts <- unique(links_unl)

