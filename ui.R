library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("Grassland oct-nov productivity forecasting"),
  sidebarPanel(
    sliderInput('pp', 'March Precipitacion',value = 100, min = 50, max = 250, step = 25,),
    sliderInput('confint', 'Confidence Interval',value = 0.95, min = 0.70, max = 0.95, step = 0.05,)
    ),
  mainPanel(
    h3(textOutput("caption")),
    plotOutput('ppnaplot'))
))