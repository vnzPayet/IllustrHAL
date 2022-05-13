graphJH <- ggplot(data = starwars) +
  aes(x = height) +
  geom_density()

print(graphJH)