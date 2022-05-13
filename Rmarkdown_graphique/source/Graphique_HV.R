graphHV <- ggplot(data = starwars, mapping = aes(x = gender, y = height)) + 
  geom_boxplot(aes(fill = gender )) +
  theme(legend.position = "top") +
  ggtitle("Height fuction of gender") +
  theme(plot.title  = element_text(color ="red",size=20, face="bold.italic" ))

print(graphHV)
