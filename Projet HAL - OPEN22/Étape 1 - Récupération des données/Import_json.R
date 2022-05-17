library("rjson")

url <- "https://api.archives-ouvertes.fr/search/?q=*&fq=(collId_i%3A9626)&start=0&rows=0&wt=json&facet=true&facet.field=submitType_s&facet.sort=count"

result <- fromJSON(file = url)


print(result)
names(result)
str(result)
