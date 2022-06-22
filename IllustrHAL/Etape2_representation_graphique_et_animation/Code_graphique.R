# Graphique montrant l'évolution du nombre de fichiers et du nombre de notices 

# Tableau de données : "data/enregistrements"
# Noms des colonnes : "date", "heure", "notice", "fichier"

## packaqes #####
library(tidyverse)

## Importer le tableau à partir d'un fichier csv ####
# enregistrement <- read.table("data/enregistrements.txt", sep = ",", header = TRUE)

enregistrement <- read_csv("data/enregistrements.csv", 
                           col_types=cols(
                               date=col_date(format="%d/%m/%Y")
                           ))

## Graphiques ####
n_enregistrement <- nrow(enregistrement)
n_notice <- enregistrement$notice[n_enregistrement]
n_file <- enregistrement$file[n_enregistrement]
offset <- 1.2 
maxi <- max(c(n_notice,n_file))*offset


## Dessine moi une histoire
nb_etape1 <- 40
nb_etape2 <- 15
nb_etape3 <- 40
nb_etape4 <- 10

## au commencement...
notice0 <- enregistrement$notice[1]/2
file0 <- enregistrement$file[1]/2

## une histoire
NBnotices1 <- seq(notice0, enregistrement$notice[1], le=nb_etape1)
NBfiles1 <- seq(file0, enregistrement$file[1], le=nb_etape1)
NBnotices2 <- enregistrement$notice[1]
NBfiles2 <- enregistrement$file[1]
NBnotices3 <- seq(enregistrement$notice[1],n_notice, le=nb_etape3)
NBfiles3 <- seq(enregistrement$file[1], n_file, le=nb_etape3)

## Création des graphiques au format png   

## Série 1
for (i in 1:nb_etape1){
    
    annee <- 2017+ceiling(1:i/10)
    
    png(str_glue("figs/Hal-o-metre_{i+1000}.png"), 
        width = 400, height = 480)
    #png("Hal-o-metre.png", width = 400, height = 480)
    par(mar=c(4,4,4,10))
    barplot(c(NBnotices1[i], NBfiles1[i]), 
            names.arg = c("Notices", "Texte intégral"),
            main=annee[i],
            xlab="",
            ylab="Nombre de dépôts",
            col=c(rgb(0, 0, 95/255), rgb(1, 70/255, 0)),
            las=1,
            ylim=c(0,maxi))
    #abline(h=200, col="black", lty = "dashed", lwd=3)
    dev.off()
}
 
## série 2
for (i in 1:nb_etape2){
    index <- nb_etape1+i
    png(str_glue("figs/Hal-o-metre_{index+1000}.png"), 
        width = 400, height = 480)
    #png("Hal-o-metre.png", width = 400, height = 480)
    par(mar=c(4,4,4,10))
    barplot(c(NBnotices2, NBfiles2), 
            names.arg = c("Notices", "Texte intégral"),
            main="",
            xlab="",
            ylab="Nombre de dépôts",
            col=c(rgb(0, 0, 95/255), rgb(1, 70/255, 0)),
            las=1,
            ylim=c(0,maxi))
    #abline(h=200, col="black", lty = "dashed", lwd=3)
    dev.off()
} 
  
## série 3
for (i in 1:nb_etape3){
    index <- nb_etape1+nb_etape2+i
    png(str_glue("figs/Hal-o-metre_{index+1000}.png"), 
        width = 400, height = 480)
    #png("Hal-o-metre.png", width = 400, height = 480)
    par(mar=c(4,4,4,10))
    barplot(c(NBnotices3[i], NBfiles3[i]), 
            names.arg = c("Notices", "Texte intégral"),
            main="",
            xlab="",
            ylab="Nombre de dépôts",
            col=c(rgb(0, 0, 95/255), rgb(1, 70/255, 0)),
            las=1,
            ylim=c(0,maxi))
    #abline(h=200, col="black", lty = "dashed", lwd=3)
    dev.off()
} 
## Animation ####
system("convert -delay 5 figs/*.png -loop 1 hal-o-meter.gif")
setwd("figs")
file.remove(list.files(pattern="*.png"))
setwd("..")
