# Graphique montrant l'évolution du nombre de fichiers et du nombre de notices 

# Tableau de données : "tableau"
# Noms des colonnes : "date", "notice", "fichier"

# Importer le tableau à partir d'un fichir txt
tableau <- read.table("tableau_fictif.txt", sep = ",", header = TRUE)
dim(tableau)
names(tableau)


library(tidyverse)
library(dplyr)
#tableau <- 
tableau <- as_tibble(tableau)

# Graphiques
longueur_tableau <- nrow(tableau)

notice_derniere_ligne <- tableau %>%
  slice(longueur_tableau)%>%
  select(notice)

## Sélection de la dernière valeur de la colonne file
file_derniere_ligne <- tableau %>%
  slice(longueur_tableau)%>%
  select(file)

## Les dernière valeurs en nombre simple
notice_derniere_ligne <- as.integer(notice_derniere_ligne)
file_derniere_ligne <- as.integer(file_derniere_ligne)

maxi <- max(c(file_derniere_ligne,notice_derniere_ligne))

for (i in 1:longueur_tableau){
  notice_premiere_ligne <- tableau %>%
    slice(i)%>%
    select(notice)
  file_premiere_ligne <- tableau %>%
    slice(i)%>%
    select(file)
  
  notice_premiere_ligne <- as.integer(notice_premiere_ligne)
  file_premiere_ligne <- as.integer(file_premiere_ligne)
  
  
 # png(str_glue(str_glue("Graphique n°{i}.png")), width = 400, height = 480)
  png(str_glue(str_glue("fig/Graphique_{i+100}.png")), width = 400, height = 480)
  par(mar=c(4,4,4,10))
  barplot(c(file_premiere_ligne, notice_premiere_ligne), 
          names.arg = c("File", "Notice"),
          main="Représentation graphique du nombre de dépôt en fonction du type de publication",
          xlab="Type de publication",
          ylab="Nombre de dépôts",
          col=c("cadetblue3", "sienna1"),
          las=1,
          ylim=c(0,maxi))
  abline(h=200, col="grey", lwd=2)
  dev.off()
  }
  
  
