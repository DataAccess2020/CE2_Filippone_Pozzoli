# We start by loading the RCurl package.

library(RCurl)

# We assign the URL of the website we are interested in to an object called
# "url".

url <- "https://beppegrillo.it/un-mare-di-plastica-ci-sommergera/"

# We download the webpage politely, indicating out email and our R version.

resp <- getURL(url=url, httpheader= c(from ="cristina.pozzoli@icloud.com", 
                              'User-Agent' = R.Version()$version.string))