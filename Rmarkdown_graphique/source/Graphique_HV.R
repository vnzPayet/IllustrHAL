graphHV <-ggplot(data = starwars, mapping = aes(x = gender, y = height)) + 
  geom_boxplot()

print(graphHV)

