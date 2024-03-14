# Load required libraries
library(shiny)
library(ggplot2)

# Define the user interface
ui <- fluidPage(
  titlePanel("Interactive Scatter Plot"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "x_var",
        label = "Choose a variable for the x-axis:",
        choices = colnames(mtcars),
        selected = "mpg"
      ),
      selectInput(
        inputId = "y_var",
        label = "Choose a variable for the y-axis:",
        choices = colnames(mtcars),
        selected = "hp"
      )
    ),
    
    mainPanel(
      plotOutput("scatterPlot")
    )
  )
)

# Define the server logic
server <- function(input, output) {
  output$scatterPlot <- renderPlot({
    ggplot(data = mtcars, aes_string(x = input$x_var, y = input$y_var)) +
      geom_point() +
      labs(x = input$x_var, y = input$y_var) +
      theme_minimal()
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
