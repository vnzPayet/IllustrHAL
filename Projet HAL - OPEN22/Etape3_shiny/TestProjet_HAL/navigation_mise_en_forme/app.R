library(shiny)
#install.packages("shinythemes")
library(shinythemes)
#importation données 
tableau <- read.csv2("tableau_fictif.txt", header=TRUE, sep=",")

## UI ###
ui <- fluidPage(theme=shinytheme("sandstone"),
                navbarPage("Evolution HALathon",
                 tabPanel("About page",
                          h4("Cette page a étée créer dans le contexte HALathon par des étudiants ISARA 4ème année dans le cadre du module optionnel OPEN 2022"
                          ),
                          img(src="isara.png", height= 140, width= 400)
                          ),
           tabPanel("Documentation"),
           
           tabPanel("Application",
                    sidebarLayout(
                      sidebarPanel(
                        tags$head(tags$script(src = "message-handler.js")),
                        actionButton("do", "Actualisation"),
                      sidebarPanel(
                        tags$head(tags$script(src = "message-handler.js")),
                        actionButton("go", "Graph")
                      )
                      ),
                      
                      
                      mainPanel(
                        tableOutput("table")
                        #plotOutput("distPlot")
                      )
              
                    )
)
)
)


server <- function(input, output, session) {
  df <- eventReactive(input$do, {
    #head(tableau, 2)
    tableau
  })
  output$table <- renderTable({
    df()
  })
  
  gp <- eventReactive(input$go,{
    tableau
  })
  
  output$table <- renderTable({
    gp()
  })
  
}


## la ligne de lancement #######
# Run the application 
shinyApp(ui = ui, server = server)