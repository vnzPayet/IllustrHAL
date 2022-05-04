iris1 <- read.table("DesIris.txt", header=TRUE, dec=".", sep=" ")

#Des commandes pour sélectionner des sous-parties d’une table

iris1[ ,1]   # sélection d'une colonne par son numéro avec [,n]
iris1[1, ]   # sélection d'une ligne par son numéro avec [n,]
iris1[1,2]  # sélection d'une case avec [nlig,ncol]
iris1$SepalLength    # poursuivez les commentaires
iris1[c(1,5,10), ]
iris1[-(5:30), ]
iris1[ ,1:4]
iris1[c(1,5,10) , 1:4]
iris1[iris1$Species=="virginica", ] # sélection conditionnelle
iris1[iris1$SepalLength > 7 , ]
iris1[iris1$SepalLength < 6  &  iris1$Species=="virginica" , ]

#Des commandes pour sélectionner des sous-parties d’un vecteur 

iris1$SepalLength[iris1$Species=="virginica"]
# on n'utilise plus de vigule car on pose la condition sur un  vecteur 

# on peut aussi faire 
iris1[iris1$Species=="virginica",]$SepalLength
# ici on utilise la virgule car on pose d'abord la condition sur le tableau

#Des commandes pour appliquer un calcul à des sous-ensembles :

apply(iris1[ ,1:4], MARGIN=2, mean)
tapply(iris1$SepalLength, iris1$Species, mean)
  