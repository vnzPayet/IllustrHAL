server <- function(input, output) {
  df <- eventReactive(input$do, {
    #source("sources/requete.r")
      source("../Etape1_recuperation_des_donnees/script_import.R")
  })
  
  texte1 <- eventReactive(input$do, {
      "Voici les 5 dernières valeurs. Les valeurs ont bien été enregistrées dans le fichier de sauvegarde."
  })
  
  output$texte <- renderText({
      texte1()
  })
  
  output$table <- renderTable({
    df()
  })
  
 
  #### bouton Graph
  v <- reactiveValues(doPlot = FALSE)
  
  gp <- eventReactive(input$graph, {
    #source("sources/figure.r")
     source("../Etape2_representation_graphique_et_animation/Code_graphique.R")
  })
  
  observeEvent(input$graph, {
      # 0 will be coerced to FALSE
      # 1+ will be coerced to TRUE
      v$doPlot <- input$graph
  })
  
  output$barplot <- renderImage({
      if (v$doPlot == FALSE) {
          filename <- "blank.png"
          }
      else {
      filename <- "hal-o-meter.gif"}     
      # Return a list containing the filename
      list(src = filename)
  }, deleteFile = FALSE)
 
  
  ## Bouton reset 
  observeEvent(input$reset, {
      # 0 will be coerced to FALSE
      # 1+ will be coerced to TRUE
      v$doPlot <- FALSE
  })
  
  reset <- eventReactive(input$reset, {
    reset
    
  })
  
}
