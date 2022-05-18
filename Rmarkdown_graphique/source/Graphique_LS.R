graphLS <- ggplot(data = flights, aes(x = air_time, y = distance)) + 
  geom_point(colour = "black") +
  geom_smooth(method = lm, se = FALSE) +
  ggtitle("Temps de vol en fonction de la distance") +
  theme(plot.title  = element_text(color ="black",size=7, face="bold.italic" ))

print(graphLS)