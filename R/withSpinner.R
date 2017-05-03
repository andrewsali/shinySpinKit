#' Add a spinner that shows when an output is recalculating
#' @export
#' @param ui_element A UI element that should be wrapped with a spinner when the corresponding output is being calculated.
#' @param class Define the type of spinner to show. Defaults to 'sk-rotating-plane'. For further types, see the list returned by \code{\link{spinner_types}}.
#' @param color The color of the spinner to be applied in HTML
withSpinner <- function(ui_element,type="rotating-plane",color=getOption("spinner.color")) {
  shiny::tagList(
    shiny::singleton(
      shiny::tags$head(shiny::tags$link(rel="stylesheet",href="assets/spinner.css"))
    ),
    shiny::singleton(
      shiny::tags$script(src="assets/spinner.js")
    ),
    shiny::singleton(
      shiny::tags$head(shiny::tags$link(rel="stylesheet",href="SpinKit/css/spinkit.css"))
    ),
    shiny::div(class="shiny-spinner-output-container",
        shiny::div(class="shiny-spinner-spinner-container",
                createSpinner(type,color=color)
        ),
        ui_element
    )
  )
}