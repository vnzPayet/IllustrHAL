#### 06/05/2022
#### Pauline M. Perrin

# Import du jeu de données
library(nycflights13)
flights
library(dplyr)

# Identification des variables du jeu de données nycflights13
head(flights)
names(flights)

# Le contexte statistique
dim(flights)
ncol(flights)
nrow(flights)

# Sélection des vols à destination de Houston (IAH or HOU)
flights %>%
  filter(dest=="IAH" | dest =="HOU") 

# Sélection des vols arrivés avec un retard de deux heures ou plus
flights %>%
  filter(flights$arr_delay >= 120)


# Sélection des vols réalisés par les compagnies United, American, ou Delta
flights %>%
  filter(flights$carrier %in% c("AA","UA","DL"))

# Sélection des vols réalisés en été (Juillet, Août et Septembre)
flights %>%
  filter(flights$month %in% c(7,8,9))

# Sélection des vols arrivés avec plus de deux heures de retard mais qui sont partis à l'heure
flights %>%
  filter((flights$arr_delay > 120) & (flights$dep_delay <= 0))

# Sélection des vols partis entre minuit et 6 heures du matin inclus
flights %>%
  filter(flights$hour <= 6 | flights$hour == 24)

# Sélection des vols American ayant un retard de 2h ou plus au décollage
flights %>%
  filter(carrier=="AA") %>%
  filter(dep_delay>120)

#Sélection des variables textuelles dans le tableau  
flights %>%
  select(where(is.character))

# Création d'une nouvelle colonne avec la durée de vol en heures à partir d'une variable existente
flights %>%
  mutate(duree = air_time/60) %>%
  select(flight, duree, air_time) %>%
  arrange(air_time)




library(tidyverse)

# Graphique des proportions de vols réalisés par chacune des compagnies aériennes étudiées
ggplot(data=flights) +
  geom_bar(mapping = aes(x = carrier, y = stat(prop), group = 1))

# Répartition des compagnies aériennes en fonction des destinations
ggplot(data=flights) +
  geom_bar(mapping = aes (x = dest, fill = carrier)) +
  ggtitle("Répartition des compagnies aériennes en fonction des destinations")

# Répartition des retards au départ en fonction des compagnies aériennes
flights%>%
  select(carrier, air_time) %>%
  arrange(carrier) %>%
  ggplot() +
  geom_boxplot(aes(x=carrier, y=air_time))
  ggtitle("Répartition des retards au départ en fonction des compagnies aériennes")
