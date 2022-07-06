# Graphique montrant l'évolution du nombre de fichiers et du nombre de notices 

# Tableau de données : "data/enregistrements"
# Noms des colonnes : "date", "heure", "notice", "fichier"

## packaqes #####
library(tidyverse)

## Importer le tableau à partir d'un fichier csv ####

enregistrement <- read_csv("../data/enregistrements.csv", 
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
nb_etape1 <- 30
nb_etape2 <- 35
nb_etape3 <- 40
nb_etape4 <- 10

## au commencement...
notice0 <- enregistrement$notice[1]/2
file0 <- enregistrement$file[1]/2

## une histoire
notices <- seq(notice0, n_notice, le=nb_etape1+nb_etape3)
files <- seq(file0, n_file, le=nb_etape1+nb_etape3)

## Création des graphiques au format png   ####

## Série 1
for (i in 1:nb_etape1){
    index <- i
    png(str_glue("../figs/Hal-o-metre_{index+1000}.png"), 
        width = 400, height = 480)
    par(mar=c(4,4,4,10))
    barplot(c(notices[index], files[index]), 
            names.arg = c("Notices", "Texte intégral"),
            cex.names=1.5,
            main="",
            xlab="",
            ylab="Nombre de dépôts",
            col=c(rgb(0, 0, 95/255), rgb(1, 70/255, 0)),
            las=1,
            ylim=c(0,maxi))
    dev.off()
}
 
## série 2
for (i in 1:nb_etape2){
    GR <- i*1/35
    index <- nb_etape1+i
    png(str_glue("../figs/Hal-o-metre_{index+1000}.png"), 
        width = 400, height = 480)
 
    par(mar=c(4,4,4,10))
    barplot(c(notices[nb_etape1], files[nb_etape1]), 
            names.arg = c("Notices", "Texte intégral"),
            cex.names=1.5,
            main="",
            xlab="",
            ylab="Nombre de dépôts",
            col=c(rgb(0, 0, 95/255), rgb(1, 70/255, 0)),
            las=1,
            ylim=c(0,maxi))
#    abline(h=200, col="black", lty = "dashed", lwd=3)
    text(2, 400, "30 mars 2022 :\nOuverture du \nportail HAL", 
         cex=2, 
         col=rgb(GR,GR,GR),
         xpd=NA)
        dev.off()
} 
  
## série 3
for (i in 1:nb_etape3){
    indexpng <- nb_etape1+nb_etape2+i
    index <- nb_etape1+i
    png(str_glue("../figs/Hal-o-metre_{indexpng+1000}.png"), 
        width = 400, height = 480)
 
    par(mar=c(4,4,4,10))
    barplot(c(notices[index], files[index]), 
            names.arg = c("Notices", "Texte intégral"),
            cex.names=1.5,
            main="",
            xlab="",
            ylab="Nombre de dépôts",
            col=c(rgb(0, 0, 95/255), rgb(1, 70/255, 0)),
            las=1,
            ylim=c(0,maxi))
     dev.off()
} 

N <- nb_etape1+nb_etape2+nb_etape3
png(str_glue("../figs/Hal-o-metre_{N+1001}.png"), 
    width = 400, height = 480)

par(mar=c(4,4,4,10))
barplot(c(n_notice,n_file ), 
        names.arg = c("Notices", "Texte intégral"),
        cex.names=1.5,
        main="Juillet 2022",
        xlab="",
        ylab="Nombre de dépôts",
        col=c(rgb(0, 0, 95/255), rgb(1, 70/255, 0)),
        las=1,
        ylim=c(0,maxi))
text(0.7, n_notice+50, 
     paste(n_notice, "notices"), 
     col=rgb(0, 0, 95/255), cex=1.7, xpd=NA)
text(2.1, n_file+50, 
     paste(n_file, "fichiers"), 
     col=rgb(1, 70/255, 0), cex=1.7, xpd=NA)
dev.off()

## Animation ####
system("convert -delay 5 ../figs/*.png -loop 1 ../Etape3_shiny/www/hal-o-meter.gif")
#system("mv hal-o-meter.gif www/")
dir <- getwd()
setwd("../figs")
file.remove(list.files(pattern="*.png"))
setwd(dir)

## Afficher le gif #####
img(src = "hal-o-meter.gif", width = 300)
