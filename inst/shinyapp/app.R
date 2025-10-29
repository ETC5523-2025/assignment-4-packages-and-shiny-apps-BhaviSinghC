library(shiny)
library(ggplot2)

ui <- fluidPage(
  titlePanel("My Assignment 4 Shiny App"),
  sidebarLayout(
    sidebarPanel(
      selectInput("dataset", "Choose dataset:",
                  choices = c("mtcars", "iris")),
      sliderInput("bins", "Number of bins:",
                  min = 1, max = 50, value = 30)
    ),
    mainPanel(
      plotOutput("distPlot")
    )
  )
)

server <- function(input, output) {
  output$distPlot <- renderPlot({
    data <- get(input$dataset)
    ggplot(data, aes(x = .data[[names(data)[1]]])) +
      geom_histogram(bins = input$bins, fill = "blue", alpha = 0.7) +
      labs(title = paste("Distribution of", names(data)[1]))
  })
}

shinyApp(ui = ui, server = server)
