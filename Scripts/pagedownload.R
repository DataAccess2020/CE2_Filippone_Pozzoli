library(RCurl)

url <- "https://beppegrillo.it/un-mare-di-plastica-ci-sommergera/"

resp <- getURL(url=url, httpheader= c(from ="cristina.pozzoli@icloud.com", 
                              'User-Agent' = R.Version()))

