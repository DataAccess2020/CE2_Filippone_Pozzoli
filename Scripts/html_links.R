# We download all the HTML links from the webpage 

library(XML)
links <- getHTMLLinks(doc=resp, externalOnly = T, relative = F)
links

# We organize all the links in a data frame.

links2<-as.data.frame(links)

#Now we extract only the links which point to other posts of the beppegrillo.it

link_unl <- unlist(links2)

library(stringr)

str_view_all(link_unl, "https://beppegrillo\\.it/.+")

links_blog <- str_extract_all(link_unl, "https://beppegrillo\\.it/.+")
links_blog_unl <- unlist(links_blog)
links_blog1 <- as.data.frame(links_blog_unl)
