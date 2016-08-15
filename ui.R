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
  titlePanel("Predicitng APPLE's stock price"),
  
  # Main content
  sidebarLayout(
    sidebarPanel(
       dateInput("sDate", "Start:", value = "2016-05-01", max = Sys.Date()),
       dateInput("eDate", "End:", max = Sys.Date()),
       checkboxInput("macd", "Include MACD:")
    ),
    
    mainPanel(
        tabsetPanel(
            tabPanel("Plot", plotOutput("distPlot")),
            tabPanel(
                "Prediciton",
                textOutput("predictionText"), h2(textOutput("prediction")),
                textOutput("realText"), h2(textOutput("real"))
            )
        )
    )
  ),
  
  # Explaining Text
  h3("User guide"),
  p("This is a shiny app to predict the close price of AAPL"),
  p("The \"plot\" tab shows the AAPL price series, in candle plot format"),
  p("The data used is the period you selected from \"Start:\" to \"End:\""),
  p("The period should be at least one week, otherwise all available data will be shown"),
  p("The \"prediction\" tab shows the AAPL price prediction, based on AR model"),
  p("AR's idea is to regress the data today on previous days and fit a linear model"),
  p("The prediction is for the next business day after \"End:\" you selected")
  
))
