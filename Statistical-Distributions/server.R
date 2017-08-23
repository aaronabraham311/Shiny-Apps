library(shiny)

shinyServer( function(input, output, session){
  
  output$myPlot <- renderPlot({
    
    distType <- input$Distribution
    size <- input$`Sample Size`
    
    if(distType == "Normal")
    {
      randomVec <- rnorm(size, mean = as.numeric(input$Mean), sd = as.numeric(input$`Standard Deviation`))
    }
    else 
    {
      randomVec <- rexp(size, rate = 1/as.numeric(input$Lambda))
    }
    
    hist(randomVec, col = "blue")
  })
  
})