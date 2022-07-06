# import du format json
url <- "https://api.archives-ouvertes.fr/search/?q=*&fq=(collId_i%3A9626)&start=0&rows=0&wt=json&facet=true&facet.field=submitType_s&facet.sort=count"
result <- fromJSON(url)

# transformation du json en tableau
brut <- result$facet_counts$facet_fields$submitType_s
brut_tab <- as.data.frame(brut)

x_notice <- as.integer(brut_tab[2 ,])
y_notice <- as.integer(brut_tab[4 ,])

notice <- x_notice
file <- y_notice
tableau <- data.frame(notice, file)
as_tibble(tableau)

# ajout d'une nouvelle colonne date
tableau <- mutate(tableau, date = format(Sys.time(), "%d/%m/%Y"))
tableau <- mutate(tableau, heure = format(Sys.time(), "%X"))

nouvelles_donnees <- tableau[,c(3, 4, 1, 2)]


# Exportation sous format txt

if (file.exists("data/tableau_data.txt") == FALSE){
    write.table(nouvelles_donnees, "data/tableau_data.txt", row.names = FALSE, sep = ",", col.names = TRUE)
    
}else{
    write.table(nouvelles_donnees[1,], file = "data/tableau_data.txt", append = TRUE, col.names = FALSE, row.names = FALSE, sep = ",")
}

nouveau_tableau <- read.table("data/tableau_data.txt", sep = ",", header = TRUE)
tail(nouveau_tableau,5)
