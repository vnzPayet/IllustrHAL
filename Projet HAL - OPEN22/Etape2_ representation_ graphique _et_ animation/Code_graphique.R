# Graphique montrant l'évolution du nombre de fichiers et du nombre de notices 

# Tableau de données : "tableau"
# Noms des colonnes : "date", "notice", "fichier"

# Importer le tableau à partir d'un fichir csv
tableau <- read.table("tableau_fictif.csv", sep = ",", header = TRUE)
dim(tableau)

names(tableau)


library(tidyverse)
library(dplyr)
as_tibble(tableau)

# Graphiques

n(tableau)

notice_premiere_ligne <- tableau %>%
  slice(1)%>%
  select(notice)
file_premiere_ligne <- tableau %>%
  slice(1)%>%
  select(file)

n <- tableau %>%
  count(tableau)


as.numeric(notice_premiere_ligne)
as.numeric(file_premiere_ligne)


maxi <- max(c(200,1000))*1.2

barplot(c(file_premiere_ligne,notice_premiere_ligne), 
        names.arg = c("File", "Notice"),
        main="Représentation graphique du nombre de dépôt en fonction du type de publication",
        xlab="Type de publication",
        ylab="Nombre de dépôts",
        col=c("cadetblue3", "sienna1"),
        las=1,
        ylim=c(0,maxi))

barplot(c(100,150), 
        names.arg = c("File", "Notice"),
        main="Représentation graphique du nombre de dépôt en fonction du type de publication",
        xlab="Type de publication",
        ylab="Nombre de dépôts",
        col=c("cadetblue3", "sienna1"),
        las=1,
        ylim=c(0,maxi))

png("Test.png", width = 400, height = 480)
barplot(c(200,300), 
        names.arg = c("File", "Notice"),
        main="Représentation graphique du nombre de dépôt en fonction du type de publication",
        xlab="Type de publication",
        ylab="Nombre de dépôts",
        col=c("cadetblue3", "sienna1"),
        las=1,
        ylim=c(0,maxi))
dev.off()

abline(h=maxi, col="grey")

