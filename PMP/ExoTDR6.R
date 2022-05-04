## Date : 04.05.2022
## TDR6


######## EXERCICE

# Import
iris1 <- read.table("DesIris.txt", header=TRUE, dec=".", sep=" ")  

# Sélection dans une table 
iris1[ ,1]   # s?lection d'une colonne par son num?ro avec [,n]
iris1[1, ]   # s?lection d'une ligne par son num?ro avec [n,]
iris1[1,2]  # s?lection d'une case avec [nlig,ncol]


iris1$SepalLength    # poursuivez les commentaires

iris1[c(1,5,10), ]
iris1[-(5:30), ] #blablablabla
iris1[ ,1:4]
iris1[c(1,5,10) , 1:4]
iris1[iris1$Species=="virginica" , ] # s?lection conditionnelle
iris1[iris1$SepalLength > 7 , ]
iris1[iris1$SepalLength < 6  &  iris1$Species=="virginica", ]

# S?lection dans un vecteur
iris1$SepalLength[iris1$Species=="virginica"]
iris1[iris1$Species=="virginica", ]$SepalLength

# Calculs sur des sous-ensembles
apply(iris1[,1:4], MARGIN=2, mean)
tapply(iris1$SepalLength, iris1$Species, mean)




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


