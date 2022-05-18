# appel des packages
library(jsonlite)
library(dplyr)

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
tableau <- mutate(tableau, date = format(Sys.time(), '%d-%m-%Y'))
tableau(date, notice, file)

tableau1 <- tableau[,c(3, 1, 2)]
tableau1

# Exportation sous format csv
write.table(tableau1, "tableau_data", row.names = FALSE)
