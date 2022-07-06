tableau <- read.table("../data/enregistrements.csv", sep = ",", header = TRUE)

tableau <- as_tibble(tableau)

# Graphiques
longueur_tableau <- nrow(tableau)

notice_derniere_ligne <- tableau %>%
    slice(longueur_tableau)%>%
    select(notice)

## Sélection de la dernière valeur de la colonne file
file_derniere_ligne <- tableau %>%
    slice(longueur_tableau)%>%
    select(file)

## Les dernière valeurs en nombre simple
notice_derniere_ligne <- as.integer(notice_derniere_ligne)
file_derniere_ligne <- as.integer(file_derniere_ligne)

notice_derniere_ligne <- tableau %>%
    slice(longueur_tableau) %>%
    select(notice)
file_derniere_ligne <- tableau %>%
    slice(longueur_tableau) %>%
    select(file)

barplot(c(as.numeric(file_derniere_ligne), as.numeric(notice_derniere_ligne)), 
        names.arg = c("File", "Notice"),
        main="Représentation graphique du nombre de
          dépôts en fonction du type de publication",
        xlab="Type de publication",
        ylab="Nombre de dépôts",
        col=c("grey", "yellow"),
        las=1,
        ylim=c(0,500))
abline(h=200, col="black", lty = "dashed", lwd=3)
legend("topright", legend = "Nombre de publications
         avant Halathon",
       col="black", lty = "dashed", lwd=3)