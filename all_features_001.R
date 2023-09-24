# Crear Mapas Interactivos en R con el paquete (package) Leaflet

# Leaflet.js - leaflet - leafem - fontawesome - HTMLWidgets

# Palacio de Gobierno: -12.044541301568078, -77.0297865051732

# The White House: 38.89787666943752, -77.03651907550645


# INSTALAR - ACTIVAR PAQUETES ---------------------------------------------

install.packages("leaflet")

install.packages("leafem")

install.packages("fontawesome")

install.packages("htmlwidgets")

library(leaflet)

library(leafem)

library(fontawesome)

library(htmlwidgets)



# MAPA BASE - OPENSTREET MAP - GRIDS (Rejillas) - HTML ---------------------------------------

# CONTENEDOR

mapa_base_001 <- leaflet()

mapa_base_001

# MAPA BASE - OpenStreetMap

mapa_base_002 <- leaflet() %>% 
  addTiles()
mapa_base_002

htmlwidgets::saveWidget(mapa_base_002,"G:/Leaflet_Mapas_R_RStudio/mapa_base_002.html")


# GRIDS (Rejillas)

mapa_base_003 <- leaflet() %>% 
  addTiles() %>% 
  addGraticule(interval = 70,style = list(color="purple",weight=2))
mapa_base_003


htmlwidgets::saveWidget(mapa_base_003,"G:/Leaflet_Mapas_R_RStudio/mapa_base_003.html")



# LATITUD - LONGITUD - MARCADOR - SETVIEW -  POPUP - HTML ----------------------------

# Palacio de Gobierno: -12.044541301568078, -77.0297865051732

# The White House: 38.89787666943752, -77.03651907550645

mapa_001 <- leaflet() %>% 
  addTiles() %>% 
  setView(lat=-12.044541301568078,lng=-77.0297865051732,zoom = 17) %>% 
  addMarkers(lat=-12.044541301568078,lng=-77.0297865051732,popup ="<b>PALACIO DE GOBIERNO</b>" )
mapa_001

htmlwidgets::saveWidget(mapa_001,"G:/Leaflet_Mapas_R_RStudio/mapa_001.html")


mapa_002 <- leaflet() %>% 
  addTiles() %>% 
  setView(lat =38.89787666943752 ,lng =-77.03651907550645 ,zoom = 17) %>% 
  addMarkers(lat =38.89787666943752 ,lng =-77.03651907550645,popup = "<b>The White House</b>")
mapa_002

htmlwidgets::saveWidget(mapa_002,"G:/Leaflet_Mapas_R_RStudio/mapa_002.html")

pdf("G:/Leaflet_Mapas_R_RStudio/prueba_001.pdf")

mapa_003 <- leaflet() %>% 
  addTiles() %>% 
  setView(lat=-12.044541301568078,lng=-77.0297865051732,zoom = 17) %>% 
  addMarkers(lat=-12.044541301568078,lng=-77.0297865051732,popup =paste(sep="<br>","LUGAR:","<b>PALACIO DE GOBIERNO</b>",
                                                                        "LATITUD:","<b>-12.044541301568078</b>","LONGITUD:","<b>-77.0297865051732</b>","WEB:",url_palacio,img_palacio) )
mapa_003


htmlwidgets::saveWidget(mapa_003,"G:/Leaflet_Mapas_R_RStudio/mapa_003.html")

url_palacio <- "<a href='https://bit.ly/3HQPR1P' target='_blank'>La Casa de Pizarro</a>"


img_palacio <- paste0("<img src='https://bit.ly/3HgZRl6' width=200 height=100 alt='PALACIO'>")



# MULTIPLES MARCADORES - CASOS - POPUP - HTML -----------------------------

# MULTIPLES MARCADORES - AddMarkers - Caso 1º

mapa_004 <- leaflet() %>% 
  addTiles() %>% 
  addMarkers(lat =-12.04457278278882 ,lng = -77.02978650324383,popup = "<b>Palacio de Gobierno</b>") %>% 
  addMarkers(lat =-12.045107907229909 ,lng = -77.03119198075981,popup = "<b>Palacio Municipal de Lima</b>") %>% 
  addMarkers(lat =-12.04650705915592 ,lng =-77.02970990517315 ,popup = "<b>Catedral de Lima</b>") %>% 
  addMarkers(lat =-12.04411110594355 ,lng =-77.0320610164758 ,popup = "<b>Convento de Santo Domingo</b>")
mapa_004

htmlwidgets::saveWidget(mapa_004,"G:/Leaflet_Mapas_R_RStudio/mapa_004.html")

# MULTIPLES MARCADORES - AddMarkers - Caso 2º

#  TXT -  lat_lng_lugar 

mapa_005 <- leaflet(data = lat_lng_lugar) %>% 
  addTiles() %>% 
  addMarkers(lat =~latitud ,lng =~longitud ,popup =~lugar )
mapa_005

htmlwidgets::saveWidget(mapa_005,"G:/Leaflet_Mapas_R_RStudio/mapa_005.html")

# MULTIPLES MARCADORES - AddMarkers - Caso 3º

# latitud_longitud_lugar CSV 

mapa_006 <- leaflet(latitud_longitud_lugar) %>% 
  addTiles() %>% 
  setView(lat=-12.0457899237514,lng =-77.03055898131903 ,zoom = 17) %>% 
  addMarkers(lat=~latitud,lng=~longitud,popup =~lugar )
mapa_006

htmlwidgets::saveWidget(mapa_006,"G:/Leaflet_Mapas_R_RStudio/mapa_006.html")

# MULTIPLES MARCADORES - AddMarkers - Caso 4º

# data frame

cent_hist <- data.frame(lugar=c("<b>Palacio de Gobierno</b>","<b>Palacio Municipal de Lima</b>","<b>Catedral de Lima</b>","<b>Convento de Santo Domingo</b>"),
                        latitud=c(-12.04457278278882,-12.045107907229909,-12.04650705915592,-12.04411110594355),
                        longitud=c(-77.02978650324383,-77.03119198075981,-77.02970990517315,-77.0320610164758))



mapa_007 <- leaflet(cent_hist) %>% 
  addTiles() %>% 
  setView(lat=-12.0457899237514,lng =-77.03055898131903 ,zoom = 18) %>%
  addMarkers(lat=~latitud,lng=~longitud,popup =~lugar )
mapa_007

htmlwidgets::saveWidget(mapa_007,"G:/Leaflet_Mapas_R_RStudio/mapa_007.html")




# AWESOME MARKERS - LATITUD - LONGITUD - POPUP - HTML ---------------------

# Palacio de Gobierno: -12.044541301568078, -77.0297865051732

# The White House: 38.89787666943752, -77.03651907550645

cent_hist_001 <- data.frame(lugar=c("<b>Palacio de Gobierno</b>","<b>Palacio Municipal de Lima</b>","<b>Catedral de Lima</b>","<b>Convento de Santo Domingo</b>"),
                        latitud=c(-12.04457278278882,-12.045107907229909,-12.04650705915592,-12.04411110594355),
                        longitud=c(-77.02978650324383,-77.03119198075981,-77.02970990517315,-77.0320610164758))


mapa_008 <- leaflet() %>% 
  addTiles() %>% 
  setView(lat=-12.044541301568078,lng = -77.0297865051732,zoom = 17) %>% 
  addAwesomeMarkers(lat =-12.044541301568078 ,lng =-77.0297865051732 ,icon =palacio_marker_001,popup ="<b>PALACIO DE GOBIERNO</b>" )
mapa_008

mapa_009 <- leaflet() %>% 
  addTiles() %>% 
  setView(lat=38.89787666943752,lng=-77.03651907550645,zoom = 17) %>% 
  addAwesomeMarkers(lat=38.89787666943752,lng=-77.03651907550645,icon =whitehouse_marker_002 ,popup = "<b>The White House</b>")
mapa_009 


htmlwidgets::saveWidget(mapa_008,"G:/Leaflet_Mapas_R_RStudio/mapa_008.html")

htmlwidgets::saveWidget(mapa_009,"G:/Leaflet_Mapas_R_RStudio/mapa_009.html")

palacio_marker_001 <- makeAwesomeIcon(
  
  icon="home",
  iconColor = "purple",
  markerColor = "darkblue",
  library = "fa"
  
)

whitehouse_marker_002 <- makeAwesomeIcon(
  
  icon="building",
  iconColor = "orange",
  markerColor = "darkred",
  library = "fa"
  
)


# MULTIPLES MARCADORES - ADDAWESOME MARKERS

#  TXT -  lat_lng_lugar 

# latitud_longitud_lugar CSV

cent_hist_001 <- data.frame(lugar=c("<b>Palacio de Gobierno</b>","<b>Palacio Municipal de Lima</b>","<b>Catedral de Lima</b>","<b>Convento de Santo Domingo</b>"),
                        latitud=c(-12.04457278278882,-12.045107907229909,-12.04650705915592,-12.04411110594355),
                        longitud=c(-77.02978650324383,-77.03119198075981,-77.02970990517315,-77.0320610164758))


mapa_010 <- leaflet(lat_lng_lugar) %>% 
  addTiles() %>% 
  addAwesomeMarkers(lat=~latitud,lng=~longitud,icon =all_icons ,popup =~lugar )
mapa_010

mapa_011 <- leaflet(latitud_longitud_lugar) %>% 
  addTiles() %>% 
  addAwesomeMarkers(lat=~latitud,lng=~longitud,icon =all_icons ,popup =~lugar )
mapa_011

mapa_012 <- leaflet(cent_hist_001) %>% 
  addTiles() %>% 
  addLegend("topright",colors = c("red","yellow","blue","dark"),labels = c("<b>Palacio de Gobierno</b>","<b>Palacio Municipal de Lima</b>","<b>Catedral de Lima</b>","<b>Convento de Santo Domingo</b>"),title="CENTRO LIMA",opacity=1) %>% 
  addAwesomeMarkers(lat=~latitud,lng=~longitud,icon =all_icons ,popup =paste(sep="<br>","<b>LUGAR:</b>",cent_hist_001$lugar,
                                                                             "<b>LATITUD:</b>",cent_hist_001$latitud,"<b>LONGITUD:</b>",cent_hist_001$longitud,"<b>WEB:</b>",all_urls,all_imgs) )
mapa_012


htmlwidgets::saveWidget(mapa_010,"G:/Leaflet_Mapas_R_RStudio/mapa_010.html")

htmlwidgets::saveWidget(mapa_011,"G:/Leaflet_Mapas_R_RStudio/mapa_011.html")

htmlwidgets::saveWidget(mapa_012,"G:/Leaflet_Mapas_R_RStudio/mapa_012.html")

# IMAGENES

img_palacio <- paste0("<img src='https://bit.ly/3HgZRl6' width=200 height=100>")

img_municipalidad <- paste0("<img src='https://bit.ly/3ruqCMy' width=200 height=100>")

img_catedral <- paste0("<img src='https://bit.ly/3qE75fN' width=200 height=100>")

img_santodomingo <- paste0("<img src='https://bit.ly/3ttzOTH' width=200 height=100>")

# URLS 


palacio <- "<a href='https://bit.ly/3HQPR1P' target='_blank'><b>La Casa de Pizarro</b></a>"

municipalidad <- "<a href='https://www.munlima.gob.pe/' target='_blank'><b>Muni Lima</b></a>"

catedral <- "<a href='https://www.museosdelima.com/catedral-de-lima/' target='_blank'><b>Catedral Lima</b></a>"

santodomingo <- "<a href='https://conventosantodomingo.pe/' target='_blank'><b>Santo Domingo</b></a>"

all_urls <- c(palacio,municipalidad,catedral,santodomingo)

all_imgs <- c(img_palacio,img_municipalidad,img_catedral,img_santodomingo)



all_icons <- awesomeIconList(
  
  "palacio_gobierno"=makeAwesomeIcon(
    
    icon="fire",
    iconColor = "blue",
    markerColor = "red",
    library = "fa"
    
  ),
  
  "municipalidad"=makeAwesomeIcon(
    
    icon="building",
    iconColor = "green",
    markerColor = "yellow",
    library = "fa"
    
  ),
  
  "catedral"=makeAwesomeIcon(
    
    icon="home",
    iconColor = "brown",
    markerColor = "blue",
    library = "fa"
  ),
  
  "santodomingo"=makeAwesomeIcon(
    
    icon="home",
    iconColor = "red",
    markerColor = "black",
    library = "fa"
  )
  
  
  
)



# CIRCULOS - CONFIGURACION - POPUP - HTML ---------------------------------


# Palacio de Gobierno: -12.044541301568078, -77.0297865051732

# The White House: 38.89787666943752, -77.03651907550645


mapa_013 <- leaflet() %>% 
  addTiles() %>% 
  setView(lat=-12.044541301568078,lng =-77.0297865051732 ,zoom =17 ) %>% 
  addCircles(lat=-12.044541301568078,lng =-77.0297865051732 ,color="#4A235A",fillColor = "#BA4A00",radius = 30,weight = 4,popup = "<b>PALACIO DE GOBIERNO</b>")
mapa_013

mapa_014 <- leaflet() %>% 
  addTiles() %>% 
  setView(lat=38.89787666943752,lng =-77.03651907550645 ,zoom=17) %>% 
  addCircles(lat=38.89787666943752,lng =-77.03651907550645,color="#F1C40F",fillColor = "#1B4F72",fillOpacity = 0.8,radius = 30,weight = 5,popup = "<b>The White House</b>")
mapa_014

# Plaza Mayor: -12.045863371934297, -77.03054825248368

mapa_015 <- leaflet() %>% 
  addTiles() %>% 
  setView(lat=-12.044541301568078,lng =-77.0297865051732,zoom = 17) %>% 
  addCircleMarkers(lat=-12.044541301568078,lng =-77.0297865051732,color="#BA4A00",fillColor = "#F1C40F",fillOpacity = 0.7,radius = 30,weight = 4,popup = "<b>PALACIO DE GOBIERNO</b>")
mapa_015






#  circulos_latitud_longitud - TXT

# circulos_latitud_longitud_01- CSV


cent_hist_003 <- data.frame(lugar=c("<b>PALACIO DE GOBIERNO</b>","<b>MUNICIPALIDAD DE LIMA</b>","<b>CATEDRAL DE LIMA</b>","<b>CONVENTO SANTO DOMINGO</b>"),
                            latitud=c(-12.04457278278882,-12.045107907229909,-12.04650705915592,-12.04411110594355),
                            longitud=c(-77.02978650324383,-77.03119198075981,-77.02970990517315,-77.0320610164758),
                            color=c("#8E44AD","#1ABC9C","#F1C40F","#D35400"),
                            radio=c(30,30,30,30),ancho=c(5,5,5,5),relleno=c("#85929E","#D0D3D4","#145A32","#2874A6"),
                            opacidad=c(0.6,0.6,0.6,0.6))





mapa_016 <- leaflet(circulos_latitud_longitud) %>% 
  addTiles() %>% 
  setView(lat =-12.045863371934297 ,lng =-77.03054825248368 ,zoom = 17) %>% 
  addCircleMarkers(lat=~latitud,lng=~longitud,color=~colores,radius =~radio ,weight=~ancho,popup = ~lugar)
mapa_016

mapa_017 <- leaflet(circulos_latitud_longitud_01) %>% 
  addTiles() %>% 
  setView(lat =-12.045863371934297 ,lng =-77.03054825248368 ,zoom = 17) %>% 
  addCircleMarkers(lat=~latitud,lng=~longitud,color=~colores,radius =~radio ,weight=~ancho,popup = ~lugar)
mapa_017

mapa_018 <- leaflet(cent_hist_003) %>% 
  addTiles() %>% 
  setView(lat =-12.045863371934297 ,lng =-77.03054825248368 ,zoom = 17) %>%
  addCircleMarkers(lat=~latitud,lng =~longitud ,color=~color,fillColor =~relleno ,fillOpacity =~opacidad ,radius =~radio ,weight =~ancho ,popup =~lugar )
mapa_018


htmlwidgets::saveWidget(mapa_018,"G:/Leaflet_Mapas_R_RStudio/mapa_018.html")



htmlwidgets::saveWidget(mapa_013,"G:/Leaflet_Mapas_R_RStudio/mapa_013.html")

htmlwidgets::saveWidget(mapa_014,"G:/Leaflet_Mapas_R_RStudio/mapa_014.html")

htmlwidgets::saveWidget(mapa_015,"G:/Leaflet_Mapas_R_RStudio/mapa_015.html")

htmlwidgets::saveWidget(mapa_016,"G:/Leaflet_Mapas_R_RStudio/mapa_016.html")




# POLYLINES ---------------------------------------------------------------

# PLAZA MAYOR: -12.0457689385526, -77.0305697101544

# tres_puntos_plazamayor TXT


mapa_019 <- leaflet(tres_puntos_plazamayor) %>% 
  addTiles() %>% 
  setView(lat = -12.0457689385526,lng =-77.0305697101544 ,zoom = 17) %>% 
  addPolylines(lat=~latitud,lng=~longitud,color = "purple",weight=6) %>%
  addPopups(lat=~latitud,lng=~longitud,popup =~lugar ) %>% 
  addMarkers(lat=~latitud,lng=~longitud)
mapa_019

htmlwidgets::saveWidget(mapa_019,"G:/Leaflet_Mapas_R_RStudio/mapa_019.html")



# TILES - LOGO - MINIMAP - LAYERS -----------------------------------------

mapa_020 <- leaflet() %>% 
  addTiles(group = "OSM Default") %>% 
  addProviderTiles(providers$Stamen.Terrain, group = "Stamen Terrain") %>%
  addProviderTiles(providers$CartoDB,group = "CartoDB") %>% 
  addLayersControl(baseGroups = c("OSM Default","Stamen Terrain","CartoDB"),position = "bottomright",options = layersControlOptions(collapsed = FALSE)) %>% 
  addMiniMap(tiles = providers$Stamen.Terrain,position = "bottomleft",toggleDisplay = TRUE) %>% 
  addLogo(logo_R,position = "topright",src="remote",height=50,width=50,url = "https://cran.r-project.org/") %>% 
  addMarkers(lat =-12.04457278278882 ,lng = -77.02978650324383,popup = "<b>Palacio de Gobierno</b>") %>% 
  addMarkers(lat =-12.045107907229909 ,lng = -77.03119198075981,popup = "<b>Palacio Municipal de Lima</b>") %>% 
  addMarkers(lat =-12.04650705915592 ,lng =-77.02970990517315 ,popup = "<b>Catedral de Lima</b>") %>% 
  addMarkers(lat =-12.04411110594355 ,lng =-77.0320610164758 ,popup = "<b>Convento de Santo Domingo</b>")
mapa_020

htmlwidgets::saveWidget(mapa_020,"G:/Leaflet_Mapas_R_RStudio/mapa_020.html")

logo_R <- "https://www.r-project.org/logo/Rlogo.svg"




# prueba

mapa_021 <- leaflet() %>% 
  addTiles(group = "OSM Default") %>%
  addProviderTiles(providers$Stamen,group = "Stamen") %>%
  addProviderTiles(providers$CartoDB.Positron,group = "CartoDB Positron") %>% 
  addLayersControl(baseGroups = c("OSM Default","Stamen","CartoDB Positron"),position="bottomright",options = layersControlOptions(collapsed = FALSE)) %>% 
  addLogo(R_logo,position="topright",src="remote",width=50,height=50,url = "https://cran.r-project.org/") %>% 
  addMiniMap(position = "bottomleft",toggleDisplay = TRUE) %>% 
  addMarkers(lat =-12.04457278278882 ,lng = -77.02978650324383,popup = "<b>Palacio de Gobierno</b>") %>% 
  addMarkers(lat =-12.045107907229909 ,lng = -77.03119198075981,popup = "<b>Palacio Municipal de Lima</b>") %>% 
  addMarkers(lat =-12.04650705915592 ,lng =-77.02970990517315 ,popup = "<b>Catedral de Lima</b>") %>% 
  addMarkers(lat =-12.04411110594355 ,lng =-77.0320610164758 ,popup = "<b>Convento de Santo Domingo</b>")
mapa_021

R_logo <- "https://www.r-project.org/logo/Rlogo.svg"













