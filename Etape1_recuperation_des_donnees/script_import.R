### Lecture de l'api de HAL pour nombre de notices et de fichiers
### Sauvegarde de l'historique des résultats

## Appel des packages ####
#library(jsonlite)
#library(dplyr)

## Import du format json ####
url <- "https://api.archives-ouvertes.fr/search/?q=*&fq=(collId_i%3A9626)&start=0&rows=0&wt=json&facet=true&facet.field=submitType_s&facet.sort=count"
result <- fromJSON(url)

## Transformation du json en tableau, daté ####
brut <- result$facet_counts$facet_fields$submitType_s
brut_tab <- as.data.frame(brut)

notice <- as.integer(brut_tab[2 ,])
file <- as.integer(brut_tab[4 ,])

df.tableau <- data.frame(notice, file)

## Ajout de date et heure
enregistrement <- df.tableau %>% 
    mutate(date = format(Sys.time(), "%d/%m/%Y")) %>% 
    mutate(heure = format(Sys.time(), "%X")) %>% 
    select(date, heure, notice, file)

## Exportation et sauvegarde, format csv ####
if (file.exists("../data/enregistrements.csv") == FALSE){
  write.table(enregistrement, "../data/enregistrements.csv", row.names = FALSE, sep = ",", col.names = TRUE)

}else{
  write.table(enregistrement[1,], file = "../data/enregistrements.csv", append = TRUE, col.names = FALSE, row.names = FALSE, sep = ",")
}

## Tableau à afficher ####
nouveau_tableau <- read.table("../data/enregistrements.csv", sep = ",", header = TRUE)
as_tibble(nouveau_tableau) %>% slice_tail(n=5)
