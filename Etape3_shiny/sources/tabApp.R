list(
    sidebarLayout(
    sidebarPanel(
        tags$head(tags$script(src = "message-handler.js")),
        p("Pour actualiser les nouvelles données :"),
        p("(Veuillez patienter le résultat s'affichera)"),
        actionButton("do", "Requête"),
        br(),br(),
        p("Pour afficher le graphique :"),
        tags$head(tags$script(src = "message-handler.js")),
        actionButton("graph", "Graphique"),
        actionButton("reset", "Effacer")
        
    ),
    
    mainPanel(
        tableOutput("table"),
        textOutput("texte"),
        plotOutput("barplot")
    )
    
)
)