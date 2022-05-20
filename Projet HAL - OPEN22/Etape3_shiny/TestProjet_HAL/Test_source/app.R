library(shiny)
library(shinythemes)
#importation données 
tableau <- read.csv2("tableau_fictif.txt", header=TRUE, sep=",")

## UI ###
ui <- fluidPage(theme=shinytheme("sandstone"),
                navbarPage("Evolution HALathon",
                           tabPanel("Accueil", source("tabAccueil.R", local = TRUE)$value),
                           tabPanel("Application",
                                    sidebarLayout(
                                      sidebarPanel(
                                        tags$head(tags$script(src = "message-handler.js")),
                                        p("Pour afficher les dernières requêtes :"),
                                        actionButton("do", "Requête"),
                                        br(),br(),
                                        p("Pour afficher le graphique :"),
                                        tags$head(tags$script(src = "message-handler.js")),
                                        actionButton("graph", "Graphique")
                                      ),

                                      mainPanel(
                                        tableOutput("table"),
                                        plotOutput("barplot"),
                                        textOutput("texte"),
                                      ),
                                      
                                    ),
                           ),
                            tabPanel("About page",
                                     h4("Cette page a été créer dans le contexte du",strong('HALathon'),", par des étudiants de", a(href = "https://isara.fr","l'ISARA"), "de 4ème année, dans le cadre de leur module optionnel OPEN (Outils, Perspectives et Enjeux du Numériques) 2022."),
                                     h4("La Source est à l'origine de cette demande."),
                                     h4("Le commanditaire est",strong('Oriane Debiez'),"documentaliste et représentant Les Sourcies, équipe du Centre de documentation de l'ISARA."),
                                     h4("L'accompagnement des élèves sur ce projet a été fait par",strong("Vincent PAYET"),", enseignant de l'ISARA."),
                                     h4("Les étudiants qui ont participés sont :"),
                                     h4(em("• Clovis BROGGIO")),
                                     h4(em("• Léa DANIELI")),
                                     h4(em("• Jeanne HECKENBENNER")),
                                     h4(em("• Ghislaine KOSSONOU")),
                                     h4(em("• Manon LAFONT")),
                                     h4(em("• Christophe LENZI")),
                                     h4(em("• Pauline M PERRIN")),
                                     h4(em("• Léa SAGNE")),
                                     h4(em("• Hélène VIGNON")),
                                     img(src = "isara.png", width = 300),
                                     img(src = "hal.png", width = 300),
                                     ),
                            
                           )
                )


# faire un bouton reset ???
# faire le rendertexte 
server <- function(input, output) {
  df <- eventReactive(input$do, {
    # Requete HAL et traitement json...
    tail(tableau, 3)
  })
  
  texte1 <- eventReactive(input$do, {
      "Le tableau est bien archivé (ou pas)"
  })
  
  output$texte <- renderText({
      texte1()
  })
  
  output$table <- renderTable({
    df()
  })
  
 
  #### bouton Graph
  gp <- eventReactive(input$graph, {
    tableau
  })
  
  output$barplot <- renderPlot({
    plot(gp()$notice, type = "p")
  })
  
  ## Bouton reset 
  reset <- eventReactive(input$reset, {
    reset
    
  })
  
}


## la ligne de lancement #######
# Run the application
shinyApp(ui = ui, server = server)