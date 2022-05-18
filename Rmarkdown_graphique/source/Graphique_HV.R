graphHV <- ggplot(data = starwars, mapping = aes(x = gender, y = height)) + 
  geom_boxplot(aes(fill = gender,)) +
  theme(legend.position = "right") +
  ggtitle("Height fuction of gender") +
  theme(plot.title  = element_text(color ="red",size=10, face="bold.italic" ))

print(graphHV)
