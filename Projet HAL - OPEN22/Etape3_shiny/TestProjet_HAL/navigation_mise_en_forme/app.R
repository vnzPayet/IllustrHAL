library(shiny)
library(shinythemes)
#importation données 
tableau <- read.csv2("tableau_fictif.txt", header=TRUE, sep=",")

## UI ###
ui <- fluidPage(theme=shinytheme("sandstone"),
                navbarPage("Evolution HALathon",
                           tabPanel("Documentation",
                                    h2("Tutoriel"),
                                    br(),
                                    h4(a(""),
                           )),
                           tabPanel("About page",
                                    h2("Cette page a étée créer dans le contexte du HALathon par des étudiants ISARA de 4ième année dans le cadre du module optionnel OPEN 2022"),
                                    br(),
                                    h4("Le commanditaire est Oriane Debiez, documentaliste représentante « Les sourciers.L’équipe du Centre de documentation, La Source est à l’origine de cette demande. 
L'enseignant qui a accompagné les élèves est Vincent PAYET.
Les étudiants qui ont participés sont :Clovis BROGGIO,Léa DANIELI, Jeanne HECKENBENNER,Ghislaine KOSSONOU,Manon LAFONT,Christophe LENZI,Pauline M PERRIN,Léa SAGNE,Hélène VIGNON"),
                                    br(),
                                    img(src="isara.png", width= 300),
                                    img(src = "hal.png", width = 300),
                           ),
                
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
                                        textOutput("texte")
                                      )
                                    )
                           )
                )
)


# faire un bouton reset ???
# faire le rendertexte 
server <- function(input, output) {
  df <- eventReactive(input$do, {
    # Requete HAL et traitement json...
    tail(tableau, 3)
  })
  output$table <- renderTable({
    df()
    #output$texte <- renderText({
   # "Le tableau est bien affiché"
    })
  
  gp <- eventReactive(input$graph, {
    tableau
  })
  
  
  output$barplot <- renderPlot({
    plot(gp()$notice, type = "p")
  })
  reset <- eventReactive(input$reset, {
    reset
    
  })
  
}


## la ligne de lancement #######
# Run the application
shinyApp(ui = ui, server = server)