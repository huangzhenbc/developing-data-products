#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(quantmod)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$distPlot <- renderPlot({
    getSymbols("AAPL")
    if(input$sDate + 6 < input$eDate) {
        AAPL_price = AAPL[index(AAPL) <= input$eDate & index(AAPL) >= input$sDate]
    } else {
        AAPL_price = AAPL
    }
    candleChart(AAPL_price)
    if(input$macd == TRUE) {
        addMACD()
    }
  })
  
})
