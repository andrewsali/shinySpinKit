#' Possible spinner types
#' @export
.spinner_types <- c("rotating-plane","double-bounce","wave","wandering-cubes","pulse","chasing-dots","three-bounce","circle","cube-grid","folding-cube")

#' Return a list enumerating spinner types and associated css classes
#' @param type The type of spinner to add. You can see the available types of spinners in the package variables .spinner_types
#' @param ... Further parameters to add the div tag generating the spinners
#' @export
create_spinner <- function(type=.spinner_types[1],...) {
  # depending on the spinner types, one needs to generate different inner divs
  output_divs <- NULL
  
  if (type=="rotating-plane") {
    output_divs <- shiny::div(class="sk-rotating-plane",...)
  }
  
  if (type=="double-bounce") {
    output_divs <- shiny::div(
      class="sk-double-bounce",
      do.call(shiny::tagList,lapply(1:2,function(x) shiny::div(class=sprintf("sk-child sk-double-bounce%s",x)))),
      ...        
    )
  }
  
  if (type=="wave") {
    output_divs <- shiny::div(
      class="sk-wave",
      do.call(shiny::tagList,lapply(1:5,function(x) shiny::div(class=sprintf("sk-rect sk-rect%s",x)))),
      ...        
    )
  }
  
  if (type=="wandering-cubes") {
    output_divs <- shiny::div(
      class="sk-wandering-cubes",
      do.call(shiny::tagList,lapply(1:2,function(x) shiny::div(class=sprintf("sk-cube sk-cube%s",x)))),
      ...
    )
  }
  
  if (type=="pulse") {
    output_divs <- shiny::div(class="sk-spinner sk-spinner-pulse",...)
  }
  
  if (type=="chasing-dots") {
    output_divs <- shiny::div(
      class="sk-chasing-dots",
      do.call(shiny::tagList,lapply(1:2,function(x) shiny::div(class=sprintf("sk-child sk-dot%s",x)))),
      ...
    )
  }
  
  if (type=="three-bounce") {
    output_divs <- shiny::div(
      class="sk-three-bounce",
      do.call(shiny::tagList,lapply(1:3,function(x) shiny::div(class=sprintf("sk-child sk-bounce%s",x)))),
      ...
    )
  }
  
  if (type=="circle") {
    output_divs <- shiny::div(
      class="sk-circle",
      do.call(shiny::tagList,lapply(1:12,function(x) shiny::div(class=sprintf("sk-child sk-circle%s",x)))),
      ...
    )
  }
  
  if (type=="cube-grid") {
    output_divs <- shiny::div(
      class="sk-cube-grid",
      do.call(shiny::tagList,lapply(1:9,function(x) shiny::div(class=sprintf("sk-cube sk-cube%s",x)))),
      ...
    )
  }
  
  if (type=="fading-circle") {
    output_divs <- shiny::div(
      class="sk-fading-circle",
      do.call(shiny::tagList,lapply(1:12,function(x) shiny::div(class=sprintf("sk-circle%s sk-circle",x)))),
      ...
    )
  }
  
  if (type=="folding-cube") {
    output_divs <- shiny::div(
      class="sk-folding-cube",
      do.call(shiny::tagList,lapply(c(1,2,4,3),function(x) shiny::div(class=sprintf("sk-cube sk-cube%s",x)))),
      ...
    )
  }
  
  if (is.null(output_divs)) {
    stop("Invalid spinner-type supplied.")
  }
  output_divs
}