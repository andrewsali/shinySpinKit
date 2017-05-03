.onLoad <- function(libname, pkgname) {
  shiny::addResourcePath(prefix = "assets",directoryPath = system.file("assets",package="shinySpinKit"))
  shiny::addResourcePath(prefix = "SpinKit",directoryPath = system.file("SpinKit",package="shinySpinKit"))
}
