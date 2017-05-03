#' Possible spinner types
#' @export
.spinner_types <- c("rotating-plane","double-bounce","wave","wandering-cubes","pulse","chasing-dots","three-bounce","circle","cube-grid","folding-cube")

#' Return a list enumerating spinner types and associated css classes
#' @param type The type of spinner to add. You can see the available types of spinners in the package variables .spinner_types
#' @param color The color of the spinner to be applied in HTML
#' @export
createSpinner <- function(type=.spinner_types[1],color=getOption("spinner.color")) {
  # depending on the spinner types, one needs to generate different inner divs
  output_divs <- NULL
  
  # each spinner will have a unique id, to allow seperate coloring
  id <- paste0("spinner-",shiny:::createUniqueId(4))
  
  # color styling is based on: https://github.com/Urigo/angular-spinkit/issues/10
  color_css <- shiny::tagList()
  
  if (type=="rotating-plane") {
    color_selector <- sprintf("#%s.sk-rotating-plane",id)
    output_divs <- shiny::div(id=id,class="sk-rotating-plane")
  }
  
  if (type=="double-bounce") {
    color_selector <- sprintf("#%s.sk-double-bounce > .sk-child",id)
    output_divs <- shiny::div(
      id=id,
      class="sk-double-bounce",
      do.call(shiny::tagList,lapply(1:2,function(x) shiny::div(class=sprintf("sk-child sk-double-bounce%s",x))))
    )
  }
  
  if (type=="wave") {
    color_selector <- sprintf("#%s.sk-wave > .sk-rect",id)
    output_divs <- shiny::div(
      id=id,
      class="sk-wave",
      do.call(shiny::tagList,lapply(1:5,function(x) shiny::div(class=sprintf("sk-rect sk-rect%s",x))))
    )
  }
  
  if (type=="wandering-cubes") {
    color_selector <- sprintf("#%s.sk-wandering-cubes > .sk-cube",id)
    output_divs <- shiny::div(
      id=id,
      class="sk-wandering-cubes",
      do.call(shiny::tagList,lapply(1:2,function(x) shiny::div(class=sprintf("sk-cube sk-cube%s",x))))
    )
  }
  
  if (type=="pulse") {
    color_selector <- sprintf("#%s.sk-spinner-pulse",id)
    output_divs <- shiny::div(id=id,class="sk-spinner sk-spinner-pulse")
  }
  
  if (type=="chasing-dots") {
    color_selector <- sprintf("#%s.sk-chasing-dots > .sk-child",id)
    output_divs <- shiny::div(
      id=id,
      class="sk-chasing-dots",
      do.call(shiny::tagList,lapply(1:2,function(x) shiny::div(class=sprintf("sk-child sk-dot%s",x))))
    )
  }
  
  if (type=="three-bounce") {
    color_selector <- sprintf("#%s.sk-three-bounce > .sk-child",id)
    output_divs <- shiny::div(
      id=id,
      class="sk-three-bounce",
      do.call(shiny::tagList,lapply(1:3,function(x) shiny::div(class=sprintf("sk-child sk-bounce%s",x))))
    )
  }
  
  if (type=="circle") {
    color_selector <- sprintf("#%s.sk-circle .sk-child:before",id)
    output_divs <- shiny::div(
      id=id,
      class="sk-circle",
      do.call(shiny::tagList,lapply(1:12,function(x) shiny::div(class=sprintf("sk-child sk-circle%s",x))))
    )
  }
  
  if (type=="cube-grid") {
    color_selector <- sprintf("#%s.sk-cube-grid > .sk-cube",id)
    output_divs <- shiny::div(
      id=id,
      class="sk-cube-grid",
      do.call(shiny::tagList,lapply(1:9,function(x) shiny::div(class=sprintf("sk-cube sk-cube%s",x))))
    )
  }
  
  if (type=="fading-circle") {
    color_selector <- sprintf("#%s.sk-fading-circle > .sk-circle:before",id)
    output_divs <- shiny::div(
      id=id,
      class="sk-fading-circle",
      do.call(shiny::tagList,lapply(1:12,function(x) shiny::div(class=sprintf("sk-circle%s sk-circle",x))))
    )
  }
  
  if (type=="folding-cube") {
    color_selector <- sprintf("#%s.sk-folding-cube > .sk-cube:before",id)
    output_divs <- shiny::div(
      id=id,
      class="sk-folding-cube",
      do.call(shiny::tagList,lapply(c(1,2,4,3),function(x) shiny::div(class=sprintf("sk-cube sk-cube%s",x))))
    )
  }
  
  if (is.null(output_divs)) {
    stop("Invalid spinner-type supplied.")
  }
  
  if (!is.null(color)) {
    color_css <- shiny::tags$head(
      shiny::tags$style(
        shiny::HTML(
          sprintf(
            "%s {
              background-color: %s;
            }",color_selector,color)
        )
      )
    )
  } 
  
  shiny::tagList(color_css,output_divs)
}