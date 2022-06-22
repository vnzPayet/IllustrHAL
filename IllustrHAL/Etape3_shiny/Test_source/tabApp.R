list(
    sidebarLayout(
    sidebarPanel(
        tags$head(tags$script(src = "message-handler.js")),
        p("Pour actualiser les nouvelles données :"),
        br(),
        p("Veuillez patienter le résultat s'affichera"),
        actionButton("do", "Requête"),
        br(),
        p("Pour afficher le graphique :"),
        tags$head(tags$script(src = "message-handler.js")),
        actionButton("graph", "Graphique")
    ),
    
    mainPanel(
        tableOutput("table"),
        plotOutput("barplot"),
        textOutput("texte"),
    )
    
)
)