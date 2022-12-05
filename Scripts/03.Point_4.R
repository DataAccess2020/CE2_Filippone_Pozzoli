# We download the webpage 

url2 <- "https://beppegrillo.it/category/archivio/2016/"

resp2 <- getURL(url=url2, httpheader= c(from ="cristina.pozzoli@icloud.com", 
                                      'User-Agent' = R.Version()$version.string))
resp2
