# Graphique montrant l'évolution du nombre de fichiers et du nombre de notices 

# Tableau de données : "tableau"
# Noms des colonnes : "date", "notice", "fichier"

# Importer le tableau à partir d'un fichir csv
tableau <- read.csv2("tableau.csv", header=TRUE, dec=",", sep=";")
dim(tableau)

names(tableau)


library(tidyverse)

# Graphiques

graph <- ggplot(data = tableau) +
  aes(x = fichier) +
  geom_bar() +
  xlab("Type de dépôt") +
  ylab("Nombre")

print(graph)


barplot(c(2,3), main="Nombre de dépôt",
        xlab="Type de dépôt",
        ylab="Nombre")


