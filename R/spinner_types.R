#' Possible spinner types
#' @export
.spinner_types <- c("rotating-plane","double-bounce","wave","wandering-cubes","pulse","chasing-dots","three-bounce","circle","cube-grid","folding-cube")

#' Return a list enumerating spinner types and associated css classes
#' @param type The type of spinner to add. You can see the available types of spinners in the package variables .spinner_types
#' @param color The color of the spinner to be applied in HTML
#' @export
create_spinner <- function(type=.spinner_types[1],color="#333333") {
  # depending on the spinner types, one needs to generate different inner divs
  output_divs <- NULL
  
  id <- paste0("spinner-",shiny:::createUniqueId(4))
  
  colour_css <- shiny::tagList()
  
  if (type=="rotating-plane") {
    colour_css <- shiny::singleton(
      shiny::tags$head(
        shiny::tags$style(
          shiny::HTML(
            sprintf(
            ".sk-rotating-plane {
              background-color: %s;
            }",color)
          )
        )
      )
    )
    
    output_divs <- shiny::div(id=id,class="sk-rotating-plane")
  }
  
  if (type=="double-bounce") {
    colour_css <- shiny::singleton(
      shiny::tags$head(
        shiny::tags$style(
          shiny::HTML(
            sprintf(
              ".sk-double-bounce > .sk-child {
              background-color: %s;
            }",color)
          )
        )
      )
    )
    
    output_divs <- shiny::div(
      id=id,
      class="sk-double-bounce",
      do.call(shiny::tagList,lapply(1:2,function(x) shiny::div(class=sprintf("sk-child sk-double-bounce%s",x))))
    )
  }
  
  if (type=="wave") {
    colour_css <- shiny::singleton(
      shiny::tags$head(
        shiny::tags$style(
          shiny::HTML(
            sprintf(
              ".sk-wave > .sk-rect {
              background-color: %s;
            }",color)
          )
        )
      )
    )
    
    output_divs <- shiny::div(
      id=id,
      class="sk-wave",
      do.call(shiny::tagList,lapply(1:5,function(x) shiny::div(class=sprintf("sk-rect sk-rect%s",x))))
    )
  }
  
  if (type=="wandering-cubes") {
    colour_css <- shiny::singleton(
      shiny::tags$head(
        shiny::tags$style(
          shiny::HTML(
            sprintf(
              ".sk-wandering-cubes > .sk-cube {
              background-color: %s;
            }",color)
          )
        )
      )
    )
    
    output_divs <- shiny::div(
      id=id,
      class="sk-wandering-cubes",
      do.call(shiny::tagList,lapply(1:2,function(x) shiny::div(class=sprintf("sk-cube sk-cube%s",x))))
    )
  }
  
  if (type=="pulse") {
    colour_css <- shiny::singleton(
      shiny::tags$head(
        shiny::tags$style(
          shiny::HTML(
            sprintf(
              ".sk-spinner-pulse {
              background-color: %s;
            }",color)
          )
        )
      )
    )
    
    output_divs <- shiny::div(id=id,class="sk-spinner sk-spinner-pulse")
  }
  
  if (type=="chasing-dots") {
    colour_css <- shiny::singleton(
      shiny::tags$head(
        shiny::tags$style(
          shiny::HTML(
            sprintf(
              ".sk-chasing-dots > .sk-child {
              background-color: %s;
            }",color)
          )
        )
      )
    )
    
    output_divs <- shiny::div(
      id=id,
      class="sk-chasing-dots",
      do.call(shiny::tagList,lapply(1:2,function(x) shiny::div(class=sprintf("sk-child sk-dot%s",x))))
    )
  }
  
  if (type=="three-bounce") {
    colour_css <- shiny::singleton(
      shiny::tags$head(
        shiny::tags$style(
          shiny::HTML(
            sprintf(
              ".sk-three-bounce > .sk-child {
              background-color: %s;
            }",color)
          )
        )
      )
    )
    
    output_divs <- shiny::div(
      id=id,
      class="sk-three-bounce",
      do.call(shiny::tagList,lapply(1:3,function(x) shiny::div(class=sprintf("sk-child sk-bounce%s",x))))
    )
  }
  
  if (type=="circle") {
    colour_css <- shiny::singleton(
      shiny::tags$head(
        shiny::tags$style(
          shiny::HTML(
            sprintf(
              ".sk-circle .sk-child:before {
              background-color: %s;
            }",color)
          )
        )
      )
    )
    
    output_divs <- shiny::div(
      id=id,
      class="sk-circle",
      do.call(shiny::tagList,lapply(1:12,function(x) shiny::div(class=sprintf("sk-child sk-circle%s",x))))
    )
  }
  
  if (type=="cube-grid") {
    colour_css <- shiny::singleton(
      shiny::tags$head(
        shiny::tags$style(
          shiny::HTML(
            sprintf(
              ".sk-cube-grid > .sk-cube {
              background-color: %s;
            }",color)
          )
        )
      )
    )
    
    output_divs <- shiny::div(
      id=id,
      class="sk-cube-grid",
      do.call(shiny::tagList,lapply(1:9,function(x) shiny::div(class=sprintf("sk-cube sk-cube%s",x))))
    )
  }
  
  if (type=="fading-circle") {
    colour_css <- shiny::singleton(
      shiny::tags$head(
        shiny::tags$style(
          shiny::HTML(
            sprintf(
              ".sk-fading-circle > .sk-circle:before {
              background-color: %s;
            }",color)
          )
        )
      )
    )
    
    output_divs <- shiny::div(
      id=id,
      class="sk-fading-circle",
      do.call(shiny::tagList,lapply(1:12,function(x) shiny::div(class=sprintf("sk-circle%s sk-circle",x))))
    )
  }
  
  if (type=="folding-cube") {
    colour_css <- shiny::singleton(
      shiny::tags$head(
        shiny::tags$style(
          shiny::HTML(
            sprintf(
              ".sk-folding-cube > .sk-cube:before {
              background-color: %s;
            }",color)
          )
        )
      )
    )
    
    output_divs <- shiny::div(
      id=id,
      class="sk-folding-cube",
      do.call(shiny::tagList,lapply(c(1,2,4,3),function(x) shiny::div(class=sprintf("sk-cube sk-cube%s",x))))
    )
  }
  
  if (is.null(output_divs)) {
    stop("Invalid spinner-type supplied.")
  }
  shiny::tagList(colour_css,output_divs)
}