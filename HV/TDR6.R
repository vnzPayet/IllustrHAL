## Date : 10.05.2020
## VP & VT
## Script TDR6


######## EXERCICE OPTIONNEL : utilisez le package rstudioapi pour afficher le poly dans le Viewer


######## EXERCICE  : importez DesIris.txt, testez les scripts et commentez

# Import
iris1 <- read.table("DesIris.txt", header=TRUE, dec=".", sep=" ")  

# S?lection dans une table 
iris1[ ,1]   # s?lection d'une colonne par son num?ro avec [,n]
iris1[1, ]   # s?lection d'une ligne par son num?ro avec [n,]
iris1[1,2]  # s?lection d'une case avec [nlig,ncol]


iris1$SepalLength    # sélectionner la variable par son nom

iris1[c(1,5,10), ] # sélectionner lignes 1, 5 et 10 
iris1[-(5:30), ] #afficher les lignes inférieures à 5 et supérieures à 30 déselctionner de 5 et 30
iris1[ ,1:4] # afficher les 4 premières colonnes
iris1[c(1,5,10) , 1:4] # sélectionner les lignes 1,5 et 10 en affichant les colonnes de 1 à 4 
iris1[iris1$Species=="virginica" , ] # sélection conditionnelle - sélectionner lignes ou la réponse dans la colonne species est virginica
iris1[iris1$SepalLength > 7 , ] # sélectionner lignes dont valeurs SepaLength est 7
iris1[iris1$SepalLength < 6  &  iris1$Species=="virginica", ] # sélectioner lignes dont SepaLength est inférieur à 6 et species est virginica

# S?lection dans un vecteur
iris1$SepalLength[iris1$Species=="virginica"] # donner les valeurs de SepalLength pour les lignes dont species est virginica
iris1[iris1$Species=="virginica", ]$SepalLength # donner que les virginica et ne garder que les espèces

# Calculs sur des sous-ensembles
apply(iris1[,1:4], MARGIN=2, mean) # moyenne des  colonnes de 1 à 4
tapply(iris1$SepalLength, iris1$Species, mean) # moyenne pour la colonne SepalLength et pour le sous-groupe de species




######## EXERCICE  : cr?ation du vecteur slv pour "sepal length  virginica" et statistiques

# cr?er slv
slv <- iris1$SepalLength[iris1$Species=="virginica"]

# testez et commentez
mean(slv)
var(slv)
sqrt(var(slv))
sd(slv)
min(slv)
max(slv)
range(slv)
sort(slv)
rev(slv)
sum(slv)
cumsum(slv)
median(slv)
quantile(slv,0.25)
quantile(slv)
length(slv)


######## EXERCICE  : cr?ation de variables

# le nom des lignes
n <- nrow(iris1)           # nrow() : nombre de lignes
noms <- paste("iris", 1:n) # paste() : coller
head(noms)

# le rapport de forme
rapport <- iris1$PetalLength/iris1$PetalWidth  
head(rapport)

# v?rification des longueurs 
length(noms); length(rapport); nrow(iris1)

# ajout
names(iris1)
iris1$noms <- noms
names(iris1)

iris2 <- data.frame(iris1, rapport)
names(iris2)

autre <- 1:3
iris1$num <- autre
iris1$num

# Quelle est l'esp?ce pour laquelle les p?tales ont la forme la plus ?troite 



######## EXERCICE  : t3var

t3var <- read.table("t3var.txt",header=TRUE,sep="\t")
t3var$sexe<-factor(t3var$sexe)

tai<-t3var$tai
poi<-t3var$poi
sexe<-t3var$sexe

t3var[t3var$sexe=="h" & t3var$poi>80 , c(3,2)]
t3var[c(21,2,34,11) , c(3,2)]
t3var[c(21,2,30:40,11) , c(3,2)]

t3var[c(1,10,20),]

colo <- c("goldenrod3", "darkblue")[as.numeric(t3var$sexe)] 

pttype <- c(17, 16)[as.numeric(t3var$sexe)]             
# des formes de points suivant le sexe
pttype[1:10]

titre <- paste("Poids et taille de", nrow(t3var), "individus")  
# un titre
titre

plot(poi~tai,                             # les variables
     main = titre,                        # le titre
     xlab = "Taille", ylab = "Poids",     # les noms des axes
     col = colo, pch = pttype, cex = 1.5, # la couleur, le type et la taille des points
     xlim=c(145,202), ylim=c(45,88))       # limites des axes x et y

legend(150, 88, c("Femmes", "Hommes"), pch = c(17, 20), 
       col = c("goldenrod3", "darkblue"), pt.cex=1.5, cex=0.8)

mt <- mean(tai)
mp <- mean(poi)
abline(v=mt, lty=2, lwd=2, col="lightgrey")
abline(h=mp, lty=2, lwd=2, col="lightgrey")


par(mfrow=c(3, 1),mar=c(4, 4, 2, 1)) # avec c(bas, gauche, haut, droite)

plot(tai, poi)
plot(tai)
plot(poi)
plot(poi, tai)

par(mfrow=c(1, 2),mar=c(5, 4, 2, 2)) # avec c(bas, gauche, haut, droite)

plot(tai, poi)
plot(tai)

#Exercice  t3var

# Importer les données dans un objet t3var.
t3var <- read.table("t3var.txt",header=TRUE,sep="\t")

#Identifier les noms des variables de ce jeu de données.
names(t3var)

# Définir le contexte statistique (combien d’individus, de variables, types des variables)
dim(t3var) #nb de lignes et nb de colonnes 

str(t3var) # Nb lignes et colonnes et identification objets à l'intérieur

#Sélectionner les individus 1, 10 et 20.
t3var[c(1,10,20), ]

#Sélectionner les femmes de plus de 170 cm. Combien sont-elles ?
femme170 <- t3var[t3var$sexe=="f"& t3var$tai > 170 , ]
femme170

#Pour les individus 10 à 20, donner toutes les variables sauf la première.
t3var[10:20,-1]

#Sélectionner les femmes de taille supérieure à la taille moyenne des femmes, donner l’effectif de ce sous-groupe.
moyennetaillefemme <- mean(t3var$tai[t3var$sexe=="f"],)
taillesup <- t3var[t3var$tai[t3var$sexe=="f"]>moyennetaillefemme,]
taillesup

#Donner lamoyenne des poids pour tous, puis par sexe.
mean(poi)
mean(poi[sexe=="f"])
mean(poi[sexe=="h"])
tapply(poi, sexe, mean)

#Donner la variance des poids pour tous, puis par sexe (la variance estimée ou de l’échantillon).
var(poi)
tapply(poi, sexe, var)

#Écrire une fonction qui calcule l’indice de masse corporelle (IMC=masse/taille2 taille en m).
#Appliquer cette fonction à l’ensemble du jeu de donnée pour créer une nouvelle variable.
Fonctionimc <- function(masse,taille) masse/(taille^2)
IMC  <- Fonctionimc(masse=poi, taille=tai/100) 
t3var$IMC <- IMC
t3var

#Utiliser dlpyer


