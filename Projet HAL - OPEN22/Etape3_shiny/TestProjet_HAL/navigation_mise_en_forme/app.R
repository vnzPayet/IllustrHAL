library(shiny)
library(shinythemes)
#importation données 
tableau <- read.csv2("tableau_fictif.txt", header=TRUE, sep=",")

## UI ###
ui <- fluidPage(theme=shinytheme("sandstone"),
                navbarPage("Evolution HALathon",
                           tabPanel("Accueil",
                                    h2(strong("HALathon"), "2022 !"),
                                    h4("Dans le cadre de cette cource collective aux dépôts des publications scientifiques, cette page comptabilise les différents documents et notices déposés sur le portail HAL ISARA durant ce HALathon 2022."),
                                    h4("L'onglet", strong("Application"), "vous permet de suivre en temps réel les derniers documents déposés en cliquant sur le bouton", em("Requête"),",mais aussi de suivre le nombre de publications déposé depuis le début de cette course en cliquant sur l'onglet", em("Graphique"),"."),
                                    h4("L'onglet", strong("About page"), "permet de connaitre le contexte de création de cette page ainsi que les personnes ayant travaillé dessus."),
                                    br(), #descriptif du doc à continuer/complêter + tutoriel récupération code et installation R
                                    h4(em("Tutoriel récupération du doc/code + installation R et Rstudio + shiny")),
                                    h4(a(href = "https://pbil.univ-lyon1.fr/CRAN/","Lien d'installation logiciel R"),
                                    h4(a(href = "https://www.rstudio.com/products/rstudio/download/","Lien d'installation RStudio")),  
                           )),
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