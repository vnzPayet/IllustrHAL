## Date : 04.05.2022
## Pauline M. Perrin
## TDR6


######## EXERCICE TDR 6 ######## 

# Import des données Iris 
iris1 <- read.table("DesIris.txt", header=TRUE, dec=".", sep=" ")  

# Sélection dans une table (de sous parties)
iris1[ ,1]   # sélection d'une colonne par son numéro avec [,n]
iris1[1, ]   # sélection d'une ligne par son numéro avec [n,]
iris1[1,2]  # sélection d'une case en particulier avec [nlig,ncol]


iris1$SepalLength    # affiche les données correspondantes à la longueur des sépales dans la table

iris1[c(1,5,10), ] # affiche les données des lignes 1, 5 et 10
iris1[-(5:30), ] # affiche toutes les données de la table, à l'exception de celles correspondantes
                 # au lignes allant de la 5ème à la 30ème incluses
iris1[ ,1:4] # affiche toutes les données de la table relatives aux colonnes 1 à 4 (on exclut donc
             # la 5)
iris1[c(1,5,10) , 1:4] # pour les lignes 1, 5 et 10, on afffiche seulement les données des
                       # colonnes 1 à 4
iris1[iris1$Species=="virginica" , ] # sélection conditionnelle : on sélectionne les données
                                     # relatives aux fleurs de l'espèce virginica
iris1[iris1$SepalLength > 7 , ] # on affiche les données des fleurs dont la longueur des sépales
                                # supérieure à 7
iris1[iris1$SepalLength < 6  &  iris1$Species=="virginica", ] # on affiche les données des fleurs 
# dont la longueur des sépales inférieure à 6 ET de l'espèce virginica

# Sélection dans un vecteur
iris1$SepalLength[iris1$Species=="virginica"] # affiche toutes les valeurs des longueurs des
# sépales des fleurs de l'espèce virginica
# on n'utilise plus de vigule car on pose la condition sur un  vecteur qui n'a ni ligne ni colonne.

iris1[iris1$Species=="virginica", ]$SepalLength # une autre façon de faire pour afficher toutes 
# les valeurs des longueurs des sépales des fleurs de l'espèce virginica
# ici on utilise la virgule car on pose d'abord la condition sur le tableau.

# Calculs sur des sous-ensembles
apply(iris1[,1:4], MARGIN=2, mean) # calcul des valeurs moyennes de chacune des colonnes (1 à 4)
tapply(iris1$SepalLength, iris1$Species, mean) # calcul de la longueur moyenne des sépales pour 
# chacune des 3 espèces de fleurs (par espèce)




######## EXERCICE  : création du vecteur slv pour "sepal length  virginica" et statistiques

# créer slv : on sélectionne un sous-ensemble du jeu de données à savoir : la longueur des sépales
# des fleurs de l'espèce virginica
slv <- iris1$SepalLength[iris1$Species=="virginica"]

# Pour les longueurs des sépales des fleurs de l'espèce virginica : 
mean(slv) # calcul de la valeur moyenne
var(slv) # calcul de la variance
sqrt(var(slv)) # calcul de l'écart-type = racine carrée de la variance
sd(slv) # autre façon de calculer l'écart-type de la longueur des sépales
min(slv) # donne la valeur minimale de la longueur des sépales des fleurs de l'espèce virginica
max(slv) # donne la valeur maximale de la longueur des sépales des fleurs de l'espèce virginica
range(slv) # affiche la valeur minimale et la valeur maximale de la table des données en question
sort(slv) # classe les données dans un ordre croissant
rev(slv) # affiche les valeurs des longueurs des sépales des fleurs virginica dans l'ordre
# inverse que celui du tableau d'origine
sum(slv) # fait la somme de toutes les valeurs
cumsum(slv) # fait la somme cumulée croissante de toutes les valeurs
median(slv) # calcule la valeur médiane
quantile(slv,0.25) # calcul du premier quartile
quantile(slv) # affiche tous les quartiles
length(slv) # affiche le nombre de valeurs dans la table de données correspondante


######## EXERCICE  : création de variables

# On crée un nouveau vecteur de données que l'on ajoute au tableau iris1

# le nom des lignes
n <- nrow(iris1)           # nrow() : nombre de lignes
noms <- paste("iris", 1:n) # paste() : coller
head(noms)

# le rapport de forme
rapport <- iris1$PetalLength/iris1$PetalWidth  
head(rapport)

# vérification des longueurs de chacune des listes de données
length(noms); length(rapport); nrow(iris1)

# ajout du nom aux nouvelles colonnes ainsi ajoutées
names(iris1)
iris1$noms <- noms
names(iris1)

iris2 <- data.frame(iris1, rapport)
names(iris2)

autre <- 1:3
iris1$num <- autre
iris1$num

# Quelle est l'espèce pour laquelle les pétales ont la forme la plus étroite 

# on peut déjà afficher les valeurs moyennes pour chacune des espèces, de la largeur des pétales
tapply(iris2$rapport, iris2$Species, mean)
# on voit que c'est l'espèce setosa (celle dont le rapport est la plus élevé)

# Une autre méthode de réponse plus directe : 
rapport_m<-tapply(iris2$rapport, iris2$Species, mean) 
names(rapport_m[rapport_m==max(rapport_m)])
# C'est setosa qui ressort directement 


######## EXERCICE  : t3var

# Import des données
t3var <- read.table("t3var.txt",header=TRUE,sep="\t",stringsAsFactors = TRUE)
t3var$sexe<-factor(t3var$sexe)

# On identifie le nom des variables : 
names(t3var)

tai<-t3var$tai
poi<-t3var$poi
sexe<-t3var$sexe

# On définit le contexte statistique (combien d’individus, de variables, types des variables).
dim(t3var)
str(t3var)

# On sélectionne les individus 1, 10 et 20
t3var[c(1,10,20),]

# On sélectionne les femmes de plus de 170 cm. Combien sont-elles ?
nrow(t3var[sexe=="f" & tai>170,])
# Elles sont 6

# Pour les individus 10 à 20, donner toutes les variables sauf la première.
t3var[10:20 , -1]

# Sélectionner les femmes de taille supérieure à la taille moyenne des femmes, donner l’effectif 
# de ce sous-groupe.

taimoyf <- mean(tai[sexe=="f"]) # on calcule la taille moyenne des femmes
t3var[sexe=="f" & tai>taimoyf, ] # on sélectionne les femmes de taille supérieure à la taille 
# moyenne des femmes
nrow(t3var[sexe=="f" & tai>taimoyf, ]) # on calcule l'effectif de ce sous-groupe

# Donner la moyenne des poids pour tous, puis par sexe.
mean(poi) # moyenne de tous les poids
tapply(poi, sexe, mean) # moyenne des poids par sexe

# Donner la variance des poids pour tous, puis par sexe (la variance estimée ou de l’échantillon).
var(poi) # variance des poids pour tous
tapply(poi, sexe, var) # variance des poids par sexe

# Écrire une fonction qui calcule l’indice de masse corporelle 
Fimc <- function(w,h) {return(w/(h^2))}

IMC  <- Fimc(w=poi, h=tai/100) 
t3var$IMC <- IMC
head(t3var)
