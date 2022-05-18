# Graphique montrant l'évolution du nombre de fichiers et du nombre de notices 

# Tableau de données : "tableau"
# Noms des colonnes : "date", "notice", "fichier"

# Importer le tableau à partir d'un fichir csv
tableau <- read.csv2("tableau.csv", header=TRUE, dec=",", sep=";")
dim(tableau)

names(tableau)


library(tidyverse)

# Graphiques

graph <- ggplot(data = tableau) +
  aes(x = fichier) +
  geom_bar() +
  xlab("Type de dépôt") +
  ylab("Nombre")

print(graph)

maxi <- max(c(200,300))*1.2

barplot(c(20,30), 
        names.arg = c("File", "Notice"),
        main="Nombre de dépôt",
        xlab="",
        ylab="",
        col=c("darkblue", "tomato"),
        las=1,
        ylim=c(0,maxi))

barplot(c(100,150), 
        names.arg = c("File", "Notice"),
        main="Nombre de dépôt",
        xlab="",
        ylab="",
        col=c("darkblue", "tomato"),
        las=1,
        ylim=c(0,maxi))

png("Test.png", width = 400, height = 480)
barplot(c(200,300), 
        names.arg = c("File", "Notice"),
        main="Nombre de dépôt",
        xlab="",
        ylab="",
        col=c("darkblue", "tomato"),
        las=1,
        ylim=c(0,maxi))
dev.off()

abline(h=maxi, col="grey")
