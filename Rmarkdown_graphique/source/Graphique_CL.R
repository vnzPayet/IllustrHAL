library(dplyr)
library(tidyverse)
starwars <- dplyr::starwars
dim(starwars)

a <- ggplot(starwars, aes(height, mass)) +
  geom_point(colour = "red") +
  geom_smooth(method = lm, se = FALSE) +
  theme_light() + ggtitle("Height vs Mass in Star Wars") +
  theme(plot.title  = element_text(color ="black",size=10, face="bold.italic" ))

print(a)

#a <- a + geom_point(colour = "red")
#a <- a + geom_smooth(method = lm, se = FALSE)
#a <- a + theme_light() + ggtitle("Height vs Mass in Star Wars")
#a

# on peut voir un graphique des poids en fonction de la masse des personnages de starwars. 
# La droite nous permet visualiser plus clairement la relation entre les deux facteurs. 
