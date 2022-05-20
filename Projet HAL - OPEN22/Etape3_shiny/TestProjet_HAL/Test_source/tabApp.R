list(
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
    
)
)