#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    output$plot <- renderPlot({
        set.seed(2022-09-20)  
        number_of_points <- input$numeric
        minX <- input$sliderX[1]
        maxX <- input$sliderX[2]
        minY <- input$sliderY[1]
        maxY <- input$sliderY[2]
        data1 <- runif(number_of_points, minX, maxX)
        data2 <- runif(number_of_points, minY, maxY)
        xlab <- ifelse(input$show_xlab, 'SPACE', '')
        ylab <- ifelse(input$show_ylab, 'TIMELINES', '')
        main <- ifelse(input$show_title, 'The Art of Architecture', '')
        plot(data1, data2, xlab= xlab, ylab = ylab, main =main, col = 4, type='s',
            xlim = c(-100, 100), ylim = c(-100, 100))
    }) 
})
  
