library(shiny)
library(shinythemes)
#importation données 
tableau <- read.csv2("tableau_fictif.txt", header=TRUE, sep=",")

## UI ###
ui <- fluidPage(theme=shinytheme("sandstone"),
    navbarPage("Evolution HALathon",
               tabPanel("About page",
                        h4("Cette page a étée créer dans le contexte HALathon par des étudiants ISARA 4ème année dans le cadre du module optionnel OPEN 2022"
                        ),
                        img(src="isara.png", width= 300)
               ),
               tabPanel("Documentation"),
               
               tabPanel("Application",
                        sidebarLayout(
                            sidebarPanel(
                                tags$head(tags$script(src = "message-handler.js")),
                                actionButton("do", "Actualisation"),
                                br(),br(),
                                p("Pour afficher le graph :"),
                                tags$head(tags$script(src = "message-handler.js")),
                                actionButton("graph", "Graph")
                            ),
                            mainPanel(
                                tableOutput("table"),
                                plotOutput("barplot")
                            )
                        )
               )
    )
)


server <- function(input, output) {
  df <- eventReactive(input$do, {
    # Requete HAL et traitement json...
      tail(tableau, 3)
  })
  
  ## render texte ?
  output$table <- renderTable({
    df()
  })
  
  gp <- eventReactive(input$graph, {
    tableau
  })
  
    output$barplot <- renderPlot({
      plot(gp()$notice, type="p")
  })
}


## la ligne de lancement #######
# Run the application 
shinyApp(ui = ui, server = server)