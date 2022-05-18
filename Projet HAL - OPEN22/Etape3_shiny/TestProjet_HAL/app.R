#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

#Importation données 

tableau <- read.csv2("tableau_fictif.txt", header=TRUE, sep=",")


## UI #####
# Define UI for application that draws a histogram
ui <- fluidPage( 
    titlePanel("Evolution HALathon"),
    
    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            tags$head(tags$script(src = "message-handler.js")),
            actionButton("do", "Actualisation"),
        ),
        
        # Show a plot of the generated distribution
        mainPanel(
            tableOutput("table")
            #plotOutput("distPlot")
        )
    )
)

## server #####
server <- function(input, output, session) {
    df <- eventReactive(input$do, {
        #head(tableau, 2)
        tableau
    })
    output$table <- renderTable({
        df()
    })
    
    
}



## la ligne de lancement #######
# Run the application 
shinyApp(ui = ui, server = server)
