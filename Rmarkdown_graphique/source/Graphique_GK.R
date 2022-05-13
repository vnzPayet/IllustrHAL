graphGK <- ggplot(data = papillon) +
  aes(x = Nom_vernaculaire, y = Annee_de_derniere_observation) +
  geom_point()

print(graphGK)
