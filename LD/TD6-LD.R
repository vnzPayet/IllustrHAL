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
iris1$SepalLength    # Selection variable SepalLength dans le tableau iris
iris1[c(1,5,10), ]#sélection des lignes 1, 5 et 10 
iris1[-(5:29), ] # séléection des lignes non comprises entre 5 et 29 (désélection)
iris1[ ,1:4] #affichage des 4 colonnes 
iris1[c(1,5,10) , 1:4]# affichage des 4 colonnes pour les lignes 1, 5 et 10
iris1[iris1$Species=="virginica", ] # sélection conditionnelle d'une espèce Selection de ligne
iris1[iris1$SepalLength > 7 , ] #affichage des données quand Length sup à 7
iris1[iris1$SepalLength < 6  &  iris1$Species=="virginica" , ]#affichage des données quand Length sup à 7 et espèce virginica

#Des commandes pour sélectionner des sous-parties d’un vecteur 

iris1$SepalLength[iris1$Species=="virginica"] #affiche uniquement les données Sepal Lenght et Spécies
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

#integrer dans le tableau les deux nouveaux vecteurs

iris1$noms <- noms 
names(iris1)


iris2 <- data.frame(iris1, rapport)
names(iris2)

autre <- 1:3
iris1$num <- autre
iris1$num

#Exercice : d’après ces nouvelles variables, quelle est l’espèce pour laquelle les pétales ont la forme la plus étroite ?

tapply(iris2$rapport, iris2$Species, mean) 
rapport_m<-tapply(iris2$rapport, iris2$Species, mean) 
names(rapport_m[rapport_m==max(rapport_m)])# pour avoir la réponse directe 


#5 EXERCIE T3var

#Importer les données dans un objet t3var.
t3var <- read.table("t3var.txt", header=TRUE, sep="\t")

#Identifier les noms des variables de ce jeu de données.
t3var#afficher l'ensemble des données 
head(t3var)
names(t3var)#Identifier les noms des variables (sexe, tai, poi)

#Définir le contexte statistique (combien d’individus, de variables, types des variables).
dim(t3var)#Nombre de lignes et colonnes dans le tableau 
str(t3var)#Identifier le nombre de variables (3), d'individus (66) et type des variables

#Sélectionner les individus 1, 10 et 20.
t3var[c(1,10,20), ]

#Sélectionner les femmes de plus de 170 cm. Combien sont-elles ?
fem170 <- t3var[t3var$tai > 170 & t3var$sexe=="f", ]
fem170
nrow(fem170)#6

#Pour les individus 10 à 20, donner toutes les variables sauf la première.
t3var[10:20 , -1]

#Sélectionner les femmes de taille supérieure à la taille moyenne des femmes, donner l’effectif de ce sous-groupe.
mean(t3var$tai)#174.0606
taim <- t3var[t3var$tai < 174.0606 & t3var$sexe=="f", ]
nrow(taim)#24 

#Donner la moyenne des poids pour tous, puis par sexe.


#Donner la variance des poids pour tous, puis par sexe

#Écrire une fonction qui calcule l’indice de masse corporelle (IMC=masse/taille2, taille en m)
