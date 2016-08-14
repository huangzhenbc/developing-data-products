#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
Sys.setlocale("LC_ALL", "English")
# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Charting APPLE's stock price"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       dateInput("sDate", "Start:", value = "2016-05-01"),
       dateInput("eDate", "End:"),
       checkboxInput("macd", "Include MACD:")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot")
    )
  ),
  
  # Text
  p("This is a simple shiny app showing the candel chart of AAPL"),
  p("Simply input the start and end date and a plot will be shown"),
  p("The plot is the price series of APPL between start and end "),
  p("Your period should be at least one week, otherwise all data will be shown"),
  p("Check MACD if you want to add MACD to the plot")
))
