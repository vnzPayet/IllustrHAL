#Léa Danieli
#04/05/2022
#Cours Vincent Payet 
#TD6

#2.1 Les données IRIS

iris1 <- read.table("DesIris.txt", header=TRUE, dec=".", sep=" ")

#2.2 Les commandes 

#Des commandes pour sélectionner des sous-parties d’une table

iris1[ ,1]   # sélection d'une colonne par son numéro avec [,n]
iris1[1, ]   # sélection d'une ligne par son numéro avec [n,]
iris1[1,2]  # sélection d'une case avec [nlig,ncol]
iris1$SepalLength    # poursuivez les commentaires
iris1[c(1,5,10), ]#sélection des lignes 1, 5 et 10 
iris1[-(5:29), ] # séléection des lignes non comprises entre 5 et 29
iris1[ ,1:4] #affichage des 4 colonnes 
iris1[c(1,5,10) , 1:4]# affichage des 4 colonnes pour les lignes 1, 5 et 10
iris1[iris1$Species=="virginica", ] # sélection conditionnelle d'une espèce
iris1[iris1$SepalLength > 7 , ] #affichage des données quand Length sup à 7
iris1[iris1$SepalLength < 6  &  iris1$Species=="virginica" , ]#affichage des données quand Length sup à 7 et espèce virginica


#Des commandes pour sélectionner des sous-parties d’un vecteur 

iris1$SepalLength[iris1$Species=="virginica"] #affiche uniquement les données Sepal Lenght et Spécies (2 colonnes)
# on n'utilise plus de virgule car on pose la condition sur un  vecteur 

# on peut aussi faire 
iris1[iris1$Species=="virginica",]$SepalLength #en premier la condition d'une colonne 
# ici on utilise la virgule car on pose d'abord la condition sur le tableau

#Des commandes pour appliquer un calcul à des sous-ensembles :

apply(iris1[ ,1:4], MARGIN=2, mean) # moyenne des valeurs des 4 colonnes MARGIN=1= tableau ligne si 2 tableau colonne
tapply(iris1$SepalLength, iris1$Species, mean) # moyenne par espèces de SepalLength 

#Tests

tapply(iris1$SepalWidth, iris1$Species, mean)

#3 Statistique

slv <- iris1$SepalLength[iris1$Species=="virginica"] #nommer un vecteur

#Tests:
  
median(slv)
mean(slv)
min(slv)
max(slv)

#4 Création de données 

#Ajout d'un vecteur à un tableau 

n <- nrow(iris1)
noms <- paste("iris", 1:n)#création vecteur nom
head(noms)
rapport <- iris1$PetalLength/iris1$PetalWidth  # création variable qui contient  PL/PW
head(rapport) 
length(noms); length(rapport); nrow(iris1)# 33=longeur compatible avec iris1
names(iris1)
noms[iris1$SepalWidth>4]
