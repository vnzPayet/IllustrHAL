# Import
iris1 <- read.table("DesIris.txt", header=TRUE, dec=".", sep=" ")  

# S?lection dans une table 
iris1[ ,1]   # s?lection d'une colonne par son num?ro avec [,n]
iris1[1, ]   # s?lection d'une ligne par son num?ro avec [n,]
iris1[1,2]  # s?lection d'une case avec [nlig,ncol]


iris1$SepalLength    # poursuivez les commentaires

iris1[c(1,5,10), ] #sélectionner les lignes 1 5 et 10
iris1[-(5:30), ] #sélectionner lignes < 4 et >30
iris1[ ,1:4] #sélectionner les colonnes 1 à 4
iris1[c(1,5,10) , 1:4] #sélectionner lignes 1 5 10 pour les colonnes de 1 à 4
iris1[iris1$Species=="virginica" , ] # sélection conditionnelle
iris1[iris1$SepalLength > 7 , ] # sélectionner sépales >7
iris1[iris1$SepalLength < 6  &  iris1$Species=="virginica", ] #sélectionner espece virginica avec sépales > 6

# S?lection dans un vecteur
iris1$SepalLength[iris1$Species=="virginica"] #longueur des sépales pour espece virginica
iris1[iris1$Species=="virginica", ]$SepalLength

# Calculs sur des sous-ensembles
apply(iris1[,1:4], MARGIN=2, mean) #pour les colonnes 1 à 4, moyenne de la longueur des sépales / pétales
tapply(iris1$SepalLength, iris1$Species, mean) # moyenne de la longueur des sépales pour les différentes espèces
