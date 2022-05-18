library(dplyr)
library(tidyverse)
starwars <- dplyr::starwars
dim(starwars)



graphCL <- ggplot(starwars, aes(height, mass))
graphCL<- graphCL+ geom_point(colour = "red")+ geom_smooth(method = lm, se = FALSE)
graphCL<- graphCL + theme_light() + ggtitle("Height vs Mass in Star Wars")
graphCL

print(graphCL)
# on peut voir un graphique des poids en fonction de la masse des personnages de starwars. 
# La droite nous permet visualiser plus clairement la relation entre les deux facteurs. 
