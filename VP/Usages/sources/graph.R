
graph <- ggplot(t3var)+
    aes(tai, poi, color=sexe)+
    geom_point()

print(graph)

#plot(t3var$tai, t3var$poi)
