## Pauline M. Perrin

# Import du jeu de données
library(nycflights13)
flights
library(dplyr)


library(tidyverse)

# Graphique des proportions de vols réalisés par chacune des compagnies aériennes étudiées
graphPP <- ggplot(data=flights) +
    geom_bar(mapping = aes(x = carrier, y = stat(prop), group = 1))

print(graphPP)
