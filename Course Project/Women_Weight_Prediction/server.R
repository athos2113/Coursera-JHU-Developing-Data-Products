# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.

library(shiny)
data("women")
shinyServer(function(input, output) {
  model <- lm(weight ~ height, data = women)
  model1pred <- reactive({
    HeightInput <- input$sliderH
    predict(model, newdata = data.frame(height = HeightInput))
  })
  
  output$plot1 <- renderPlot({
    HeightInput <- input$sliderH
    plot(women$height, women$weight, xlab = "Women's Height", 
         ylab = "Women's Weight", bty = "n", pch = 16)
    abline(model, col = "red", lwd = 2)
    points(HeightInput, model1pred(), col = "yellow", pch = 16, cex = 2)
    
    output$pred1 <- renderText({
      model1pred()
    })   
    
    
  })
})
