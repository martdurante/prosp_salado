library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("Grassland oct-nov productivity forecasting"),
  sidebarPanel(
    sliderInput('pp', 'March Precipitacion',value = 100, min = 50, max = 250, step = 25,),
    helpText("Note: select march precipitation to estimate next spring grassland productivity."),
    sliderInput('confint', 'Confidence Interval',value = 0.95, min = 0.70, max = 0.95, step = 0.05,),
    helpText("Note: adjust the upper and lower limits of the expected value according to the confidence level")
    ),
  mainPanel(
    h3(textOutput("caption")),
    plotOutput('ppnaplot'))
))
