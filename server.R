library(leaflet)
library(raster)
library(shiny)

shinyServer(function(input, output) {
  
  #base de datos con los municipíos de antioquia
  municipios_Ant<-shapefile("MGN_ADM_MPIO_GRAFICO.shp",encoding="UTF-8",use_iconv=TRUE)
  
  #extraemos la información de medellin
  
  med<-municipios_Ant[41,]
  
  ##barios med
  barrios_med<-shapefile("Barrio_Vereda.shp",encoding="UTF-8",use_iconv=TRUE)
  
  
  output$map <- renderLeaflet({
    
      m<-leaflet(data = med) %>% addTiles() %>% addProviderTiles(providers$OpenStreetMap) %>% 
      addPolygons(fill = FALSE, stroke = TRUE, color = "blue",opacity = 0.5) %>% addLegend("topright", colors = "blue", labels = "Medellín ")
      
      m
  })
  
  output$medellin2 <- renderLeaflet({
    #carga medellin con sus barrios
    
     
    
      m2<-leaflet(data = barrios_med) %>% addTiles() %>% addProviderTiles(providers$OpenStreetMap) %>% 
      addPolygons(fill = FALSE, stroke = TRUE, color = "blue",opacity = 0.5) %>% addLegend("topright", colors = "blue", labels = "Medellín ")
    
      m2
  })  
  
})
