
library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Plot Random Numbers"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            numericInput('numeric', 'How many random numbers should be ploted', value = 200, min = 0, max = 400, step = 10),
            sliderInput("sliderX", "Choose the minimum and maximum values of X", min = -100, max = 100, value = c(-50, 50)),
            sliderInput("sliderY", "Choose the minimum and maximum values of Y", min = -100, max = 100, value = c(-50, 50)),           
            checkboxInput('show_xlab', 'Show/Hide X AXIS Lable', value = TRUE), 
            checkboxInput('show_ylab', 'Show/Hide Y AXIS Lable', value = FALSE),
            checkboxInput('show_title', 'Show/Hide The Title')
         ),
        
        mainPanel(
            h3('Image of Time Changes'),
            plotOutput("plot")
        )
    )
))
