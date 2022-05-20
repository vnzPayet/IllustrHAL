library(shiny)
library(shinythemes)
library(jsonlite)
library(dplyr)

## UI ###
ui <- fluidPage(theme=shinytheme("sandstone"),
                navbarPage("Evolution HALathon",
                           tabPanel("Accueil", source("tabAccueil.R", local = TRUE)$value),
                           tabPanel("Application", source("tabApp.R", local = TRUE)$value),
                           tabPaneltabPanel("About page",source("tabAbout.R", local = TRUE)$value),
                           )
                )

# faire un bouton reset ???
# faire le rendertexte 
server <- function(input, output) {
  df <- eventReactive(input$do, {
    # Requete HAL et traitement json...
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
    
  })
  
  texte1 <- eventReactive(input$do, {
      "Voici les 3 dernières valeurs. Les valeurs ont bien été enregistrées dans le fichier sauvegarde."
  })
  
  output$texte <- renderText({
      texte1()
  })
  
  output$table <- renderTable({
    df()
  })
  
 
  #### bouton Graph
  gp <- eventReactive(input$graph, {
    
    tableau <- read.table("data/tableau_data.txt", sep = ",", header = TRUE)
    
    library(tidyverse)
    library(dplyr)
    
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
  })
  
  output$barplot <- renderPlot({
    gp()
  })
  
  ## Bouton reset 
  reset <- eventReactive(input$reset, {
    reset
    
  })
  
}


## la ligne de lancement #######
# Run the application
shinyApp(ui = ui, server = server)
