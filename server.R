library(ggplot2)
library(shiny)
library(magrittr)
library(dplyr)


server <- function(input, output, session) {
  
  sub <- reactive({
    cont <- input$category
    subset(chart, chart$category %in% cont)
  })
  
  
  
  
  output$distPlot <- renderPlot({
    
    dat <- sub()
    
    p <- ggplot(dat,
                aes(x = subscribers*1e6, y=NoxScore,size = totalviews, colour = category)
    ) +
      geom_point(show.legend = TRUE, alpha = 0.7) +
      scale_color_viridis_d() +
      labs(x = "Subscribers", y = "Noxscore")
    p
  })
  output$top <- renderText({ 
    #foo <- subset(chart,chart$category == input$count)
    #freq <- foo%>%group_by(area_vec)%>%summarise(no_rows = length(area_vec))
    #freq <- data.frame(freq)
    #ind <- which.max(freq$no_rows)
    paste("Area wise Distribution of channels in",input$count,"category")
  })
  
  output$pie <- renderPlot({ 
    
    dat <- sub()
    foo <- subset(chart,chart$category == input$count)
    freq <- foo%>%group_by(area_vec)%>%summarise(no_rows = length(area_vec))
    freq <- data.frame(freq)
    p <- ggplot(freq,aes(x = "", y = no_rows,fill = area_vec))+geom_bar(stat = "identity", width = 1, color = "white")+
      coord_polar("y",start = 0)+theme_void()
    
    
    p
    
  })
  
  
  
}