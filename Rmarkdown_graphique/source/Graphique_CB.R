ggplot(data = flights) +
  geom_point(mapping = aes(x = distance, y = air_time))