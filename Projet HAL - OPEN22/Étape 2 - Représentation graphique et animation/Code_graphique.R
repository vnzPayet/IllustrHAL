# Graphique montrant l'évolution du nombre de fichiers et du nombre de notices 

# Tableau de données : "tableau"
# Noms des colonnes : "date", "notice", "fichier"

# Importer le tableau à partir d'un fichir csv
tableau <- read.csv2("tableau.csv", header=TRUE, dec=",", sep=";")
dim(tableau)

names(tableau)

# Import de la fonction ggplot

library(tidyverse)

# Graphique

graph1 <- ggplot(data = tableau) +
  aes() +
  geom_bar() +
  xlab("Type de dépôt") +
  ylab("Nombre")

print(graph1)

graph2 <- ggplot(data = tableau) +
  aes() +
  geom_bar() +
  xlab("Type de dépôt") +
  ylab("Nombre")

print(graph2)

