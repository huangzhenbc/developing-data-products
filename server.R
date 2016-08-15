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
library(forecast)
library(bizdays)
Sys.setlocale("LC_ALL", "English")
shinyServer(function(input, output) {
    
    getSymbols("AAPL")
    data(holidaysANBIMA)
    cal <- Calendar(holidaysANBIMA, weekdays=c("saturday", "sunday"))
    
  output$distPlot <- renderPlot({
     
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
  
  output$predictionText <- renderText({
      paste("Predicited close price on", adjust.next(input$eDate + 1, cal), "is:")
  })
  
  output$prediction <- renderText({
      AAPL_price = AAPL[index(AAPL) <= input$eDate]
      if (nrow(AAPL_price) == 0) {
          "No data available"
      } else {
          predict(ar(AAPL_price$AAPL.Close))$pred
      }
      
  })
  
  output$realText <- renderText({
      paste("Real close price on", adjust.next(input$eDate + 1, cal), "is:")
  })
  
  output$real <- renderText({
      
      AAPL_price = AAPL[adjust.next(input$eDate + 1, cal)]
      if(nrow(AAPL_price) == 0) {
          "No data available"
      } else {
          AAPL_price$AAPL.Close
      }
        
  })
  
  
})
