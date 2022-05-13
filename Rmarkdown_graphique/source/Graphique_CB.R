graphCB <- ggplot(data = flights) +
  aes(x = distance, y = air_time)+
  geom_point(pch=".")

print(graphCB)
