library(ggplot2)
library(shiny)
library(magrittr)
library(dplyr)

# Define UI for application that draws a histogram
ui <- fluidPage(
  
  # Application title
  titlePanel("Noxscore Data"),
  
  
  sidebarLayout(
    sidebarPanel(
      checkboxGroupInput("category",
                         "Choose which Category",
                         choices = levels(chart$category),
                         selected = c("Music", "Sports")),
      selectInput("count", "Select Category for Comparison",
                  choices = levels(chart$category),
                  selected = "Music")),
    mainPanel(h3("Analysis of Noxscore, Subscribers and Total Views"),
              plotOutput("distPlot"),
              textOutput("top"),
              plotOutput("pie")
              
              
    )
  )
)
