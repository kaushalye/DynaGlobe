library(shiny)
library(shinyRGL)

shinyUI(pageWithSidebar(

  headerPanel("WebGL"),

  sidebarPanel(
     HTML("Created using <a href = \"http://github.com/trestletech/shinyRGL\">shinyRGL</a>.")
  ),

  mainPanel(
    webGLOutput("webgl")
  )
))

