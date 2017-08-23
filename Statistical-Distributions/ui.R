library(shiny)

shinyUI(
  pageWithSidebar(
    headerPanel("Distribution Examples"), # Title panal
    
    # Code for sidebar
    sidebarPanel(
      selectInput("Distribution", "Please select distribution: ", 
                  choices = c("Normal", "Exponential")), # Will have a drop down menu to choose distribution type
      sliderInput("Sample Size", "Please select sample size: ",
                  min = 100, max = 5000, value = 1000, step = 100), # Drop down menu to select sample size
      
      # Will have mean and standard deviation choices if user inputs normal distribution
      conditionalPanel(condition = "input.Distribution == 'Normal'", 
                       textInput("Mean", "Please select the mean", 10), 
                       textInput("Standard Deviation", "Please select the standard deviation", 3)), 
      
      # Will have lambda values if inputs exponential distribution
      conditionalPanel(condition = "input.Distribution == 'Exponential'",
                       textInput("Lambda", "Please select exponential lambda", 1))
    ),
    
    # Outputs plot of distribution
    mainPanel(
      plotOutput("myPlot")
    )
  )
)
