
library(ggplot2)

Papillon <- read.table("Papillon.xlsx", header= TRUE, dec=".", sep=" ",stringsAsFactors = TRUE ) 

graphGK <- ggplot(data = Papillon) +
  aes(x = Annee_de_derniere_observation, y = Nom_scientifique) +
  geom_point()

print(graphGK)


#à Partir de 2015, beaucoup plus d'espèces ont été observées 
#les espèces de papillons présentes(Limenitis camilla, Lycaena tityrus, Lycaena phlaeas)
#au début des observations ont disparu tandis que d'autres ont apparu
