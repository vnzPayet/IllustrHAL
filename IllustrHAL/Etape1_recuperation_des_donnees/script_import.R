### Lecture de l'api de HAL pour nombre de notices et de fichiers
### Sauvegarde de l'historique des résultats

## Appel des packages ####
library(jsonlite)
library(dplyr)

## Import du format json ####
url <- "https://api.archives-ouvertes.fr/search/?q=*&fq=(collId_i%3A9626)&start=0&rows=0&wt=json&facet=true&facet.field=submitType_s&facet.sort=count"
result <- fromJSON(url)

## Transformation du json en tableau, daté ####
brut <- result$facet_counts$facet_fields$submitType_s
brut_tab <- as.data.frame(brut)

x_notice <- as.integer(brut_tab[2 ,])
y_notice <- as.integer(brut_tab[4 ,])

notice <- x_notice
file <- y_notice

tableau <- data.frame(notice, file)
# as_tibble(tableau)

## Ajout de date et heure
tableau <- mutate(tableau, date = format(Sys.time(), "%d/%m/%Y"))
tableau <- mutate(tableau, heure = format(Sys.time(), "%X"))

enregistrement <- tableau[,c(3, 4, 1, 2)]

## test
#enregistrement <- data.frame(date = format(Sys.time(), "%d/%m/%Y"), 
#                             heure= "15:50:31",
#                             notice=333.1,
#                             file=1.2)


## Exportation et sauvegarde, format csv ####
if (file.exists("data/enregistrements.csv") == FALSE){
  write.table(enregistrement, "data/enregistrements.csv", row.names = FALSE, sep = ",", col.names = TRUE)

}else{
  write.table(enregistrement[1,], file = "data/enregistrements.csv", append = TRUE, col.names = FALSE, row.names = FALSE, sep = ",")
}

