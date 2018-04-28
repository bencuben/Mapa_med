library(leaflet)
library(raster)
library(shiny)


shinyUI(
  
  # Construcción de interfaz
  navbarPage("MAPAS",
             # Estadística Descriptiva: Tab para visualizar los mapas
             tabPanel(title= "Medellín",
                      div(class="outer",
                          # Mapa
                          leafletOutput(outputId = "map",height = 700)
                      )
                      
             ),
             tabPanel(title= "Medellin con municipios",
                      div(class="outer",
                        
                          # Mapa
                          leafletOutput("medellin2",height = 700)
                      )
             )
  )
)