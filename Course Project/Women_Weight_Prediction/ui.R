# This is a shiny app for predicting a women's weight
# By comparing it with her Height
library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Women's Weight Predict"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      h3("Select your Height"),
      sliderInput("sliderH", "Height in cms", 58, 72, value = 66)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel(type = "tabs", 
                  tabPanel("Documentaion", br(), h3(" This is a Shiny app that predicts 
                                                    the weight of a women, based on her height.We do this by implementing
                                                    single variable regression algorithm. You will select the appropriate
                                                    Height from the given slider (on the left), and based on your height an appropriate weight will be 
                                                    predicted by the algorithm. On the next tab you will find the plot and the predicted weight value.
                                                    Again, this is just single varible regression, and from the plot it is easily noticeable that
                                                    weight and height are linearly dependent. i.e more the height, the more you weigh.
                                                    ")), 
                  tabPanel("Prediction", br(), plotOutput("plot1"), h3("Predicted Weight is :"), textOutput("pred1")) 
                  )
                  )
                  )))
