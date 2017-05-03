library(shiny)
library(shinySpinKit)

ui <- fluidPage(
  wellPanel(
    tags$b("This example shows the loading spinner whilst the plot is loading and hides the spinner when the plot is not shown."), 
    br(),br(),
    tags$ul(
      tags$li("You can use it to wrap any kind of output."),
      tags$li("To see what happens on recalculation, click the recalculate button"),
      tags$li("To see what happens if no output should be generated, check off 'Show plots'.")
    ),
    checkboxInput("show_plot","Show plot",value=TRUE),
    actionButton("redraw_plot","Re-draw plots")
  ),
  do.call(tabsetPanel,lapply(.spinner_types,function(.type) {
    tabPanel(.type,
             fluidRow(
               column(width=6,
                      wellPanel(
                        tags$b("With spinner:"),
                        withSpinner(plotOutput(paste0("plot",which(.type==.spinner_types))),type=.type,color=sprintf("rgb(%s)",paste0(sample(0:255,3,replace=TRUE),collapse=",")))
                      )
               ),
               column(width=6,
                      wellPanel(
                        tags$b("Without spinner (default):"),
                        plotOutput(paste0("nospin_plot",which(.type==.spinner_types)))
                      )
               )
             )
    )
  }))
)

server <- function(input, output,session) {
  for (i in 1:length(.spinner_types)) {
    output[[paste0("nospin_plot",i)]] <- output[[paste0("plot",i)]] <- renderPlot({
      validate(need(input$show_plot,"Show plot is unchecked. Check to see plot."))
      input$redraw_plot
      Sys.sleep(5) # just for demo so you can enjoy the animation
      plot(
        x = runif(1e4), y = runif(1e4)
      )
    })
  }
}

shinyApp(ui = ui, server = server)
