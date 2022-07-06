ui <- fluidPage(theme=shinytheme("sandstone"),
                navbarPage("Evolution HALathon",
                           tabPanel("Accueil", source("sources/tabAccueil.R", local = TRUE)$value),
                           tabPanel("Application", source("sources/tabApp.R", local = TRUE)$value),
                           tabPanel("About page",source("sources/tabAbout.R", local = TRUE)$value),
                           )
                )

