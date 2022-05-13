
graphGK <- ggplot(data = papillon) +
  aes(x = Annee_de_derniere_observation, y = Nom_scientifique) +
  geom_point()

print(graphGK)


#à Partir de 2015, beaucoup plus d'espèces ont été observées 
#les espèces de papillons présentes(Limenitis camilla, Lycaena tityrus, Lycaena phlaeas)au début des observationt () ont disparu tandis que d'autres 