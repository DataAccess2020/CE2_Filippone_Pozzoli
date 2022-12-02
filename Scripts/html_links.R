# We download all the HTML links from the webpage 

library(XML)
links <- getHTMLLinks(doc=resp, externalOnly = T, relative = F)
links
